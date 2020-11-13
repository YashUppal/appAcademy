require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

# We will create a model for each table to abstract the SQL queries and make our life easier :)

# Questions table
class Question

  attr_accessor :id,:title,:body,:user_id

  def self.find_by_id(id)
    row = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return row.map { |row| Question.new(row) }
    # return Question.new(row.first)
  end

  def self.find_by_title(title)
    rows = QuestionsDatabase.instance.execute(<<-SQL,title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL

    return rows.map { |row| Question.new(row) }
  end

  def self.find_by_author_id(author_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    return rows.map { |row| Question.new(row) }
  end

  def self.most_followed(n)
    return QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    return QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end


  def save
    case self.id
    when nil
      # question does not exist in database
      QuestionsDatabase.instance.execute(<<-SQL,self.title,self.body,self.user_id)
        INSERT INTO
          questions(title,body,user_id)
        VALUES
          (?,?,?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      # question exists, call UPDATE
      QuestionsDatabase.instance.execute(<<-SQL,self.title,self.body,self.user_id,self.id)
        UPDATE
          questions
        SET
          (title = ?,body = ?, user_id = ?)
        WHERE
          (id = ?)
      SQL
    end
  end

  def author
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return rows.map { |row| User.new(row) }
  end

  def replies
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return rows.map { |row| Reply.new(row) }
  end

  def followers
    return QuestionFollow.followers_for_question_id(self.id)
  end

  def likers
    return QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    return QuestionLike.num_likes_for_question_id(self.id)
  end
end

# Users table
class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return rows.map { |row| User.new(row) }
  end

  def self.find_by_name(fname,lname)
    rows = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
      AND
        lname = ?
    SQL
    return rows.map { |row| User.new(row) }
    # return rows.map { |row| self.new(row) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def save
    case self.id
    when nil
      QuestionsDatabase.instance.execute(<<-SQL,self.fname,self.lname)
        INSERT INTO
          users(fname,lname)
        VALUES
          (?,?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL,self.fname,self.lname,self.id)
        UPDATE
          users
        SET
          (fname = ?, lname = ?)
        WHERE
          id = ?
      SQL
    end

  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    return QuestionFollow.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    return QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    # Average likes for a users question -> ( count of questions / count of likes )
    row = QuestionsDatabase.instance.execute(<<-SQL,self.id,self.id)
    SELECT
      CAST(COUNT(user_id) AS FLOAT)/(SELECT COUNT(id) FROM questions WHERE user_id = ?) AS avg_karma
    FROM
      question_likes
    WHERE
      question_id
    IN (
      SELECT
        id
      FROM 
        questions
      WHERE
        user_id = ?
    )
    SQL

    return row.first['avg_karma'] 
  end
end


# Question Follows table
class QuestionFollow

  attr_accessor :user_id, :question_id

  def self.find_by_user_id(user_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL

    return rows.map { |row| QuestionFollow.new(row) }
  end

  def self.find_by_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
    return rows.map { |row| QuestionFollow.new(row) }
  end

  def self.followers_for_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows
      ON
        users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL

    return rows.map { |row| User.new(row) }
  end

  def self.followed_questions_for_user_id(user_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows
      ON
        questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL

    return rows.map { |row| Question.new(row) }
  end

  def self.most_followed_questions(n)
    rows = QuestionsDatabase.instance.execute(<<-SQL,n)
      SELECT
        id,title,body,questions.user_id
      FROM
        questions
      JOIN
        question_follows
      ON
        questions.id = question_follows.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?
    SQL
    
    return rows.map { |row| Question.new(row) }
  end


  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

# Replies table
class Reply
  attr_accessor :id, :body, :user_id, :parent_id, :question_id

  def self.find_by_id(id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return rows.map { |row| Reply.new(row) }
  end

  def self.find_by_user_id(user_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return rows.map { |row| Reply.new(row) }
  end

  def self.find_by_parent_id(parent_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return rows.map { |row| Reply.new(row) }
  end

  def self.find_by_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return rows.map { |row| Reply.new(row) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @question_id = options['question_id']
  end

  def save
    case self.id
    when nil
      # reply does not exist in database
      QuestionsDatabase.instance.execute(<<-SQL,self.body,self.user_id,self.parent_id,self.question_id)
        INSERT INTO
          replies(body,user_id,parent_id,question_id)
        VALUES
          (?,?,?,?)
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      # reply exists, call UPDATE
      QuestionsDatabase.instance.execute(<<-SQL,self.body,self.user_id,self.parent_id,self.question_id,self.id)
        UPDATE
          replies
        SET
          (body = ?,user_id = ?, parent_id = ?, question_id = ?)
        WHERE
          (id = ?)
      SQL
    end
  end

  def author
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return rows.map { |row| User.new(row) }
  end

  def question
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return rows.map { |row| Question.new(row) }
  end

  def parent_reply
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return rows.map { |map| Reply.new(map) }
  end 

  def child_replies
    rows = QuestionsDatabase.instance.execute(<<-SQL,self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    return rows.map {|row| Reply.new(row) }
  end
end

# Question likes table
class QuestionLike

  attr_accessor :user_id, :question_id

  def self.find_by_user_id(user_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        user_id = ?
    SQL

    return rows.map { |row| QuestionLike.new(row) }
  end

  def self.find_by_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM  
        question_likes
      WHERE
        question_id = ?
    SQL
  end

  def self.likers_for_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM
        users
      WHERE
        id
      IN
        (
          SELECT
            user_id
          FROM
            question_likes
          WHERE
            question_id = ?
        )
    SQL

    return rows.map { |row| User.new(row) }
  end

  def self.num_likes_for_question_id(question_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        COUNT(user_id)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    return rows.first['COUNT(user_id)']
  end

  def self.liked_questions_for_user_id(user_id)
    rows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id
      IN
        (
        SELECT
          question_id
        FROM
          question_likes
        WHERE
          user_id = ?
        )
    SQL

    return rows.map { |row| Question.new(row) }
  end

  def self.most_liked_questions(n)
    row = QuestionsDatabase.instance.execute(<<-SQL,n)
    SELECT
      *
    FROM
      questions
    WHERE
      id
    IN (
        SELECT
          question_id
        FROM
          question_likes
        GROUP BY
          question_id
        ORDER BY
          COUNT(question_id)
        LIMIT
          ?
    )
    SQL
    return row.map { |row| Question.new(row) }
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end