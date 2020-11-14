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

class ModelBase
  def self.all(table)
    rows = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL
    return rows
    # return table
  end

  def self.find_by_id(id,table)
    rows = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
  end

  def self.where(options,table_name,table_obj)
    if options.instance_of?(String)
      rows = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          #{options}
      SQL

      return rows.map { |row| table_obj.new(row) }
    end

    op_str = []
    options.each do |key,value|
      op_str << ("#{key}" + " = " + "'#{value.to_s}'")
    end
    op_str =  op_str.join(" AND ")
    # return op_str

    rows = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{op_str}
    SQL
    return rows.map { |row| table_obj.new(row) }
  end

  def self.find_by(options,table_name,table_obj)
    op_str = []
    options.each do |key,value|
      op_str <<   "#{key} = '#{value}'"
    end
    op_str = op_str.join(" AND ")
    # return op_str
    rows = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{op_str}
    SQL
    return rows.map { |row| table_obj.new(row) }
  end

  def save(table_name,table_obj)

    # Pardon the mess.
    # Processes the data from the table object and tries to convert into string with can be then interpolated within SQL queries

    values_string = ""
    instance_vars = table_obj.instance_variables[1..-1]
    table_obj.instance_variables[1..-1].each do |sym|
      values_string += (sym[1..-1].to_s + ",")
    end

    arr = []
    table_obj.instance_variables[1..-1].each do |sym|
      value = eval("table_obj.#{sym[1..-1]}")
      arr << value
    end

    interpolation_ques = "(#{"?," * arr.length})"
    interpolation_ques = interpolation_ques[0...-2] + interpolation_ques[-1..-1]

    QuestionsDatabase.instance.execute(<<-SQL,arr)
      INSERT INTO
        #{table_name}(#{values_string[0..-2]})
      VALUES
        #{interpolation_ques}
    SQL
  end
end

# We will create a model for each table to abstract the SQL queries and make our life easier :)

# Questions table
class Question < ModelBase

  attr_accessor :id,:title,:body,:user_id

  def self.all
    super('questions')
  end

  def self.where(options)
    super(options,'questions',self)
  end

  def self.find_by(options)
    super(options,'questions',self)
  end

  def self.find_by_id(id)
    super(id,'questions')
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
    super('questions',self)
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
class User < ModelBase
  attr_accessor :id, :fname, :lname

  def self.all
    super('users')
  end

  def self.find_by_id(id)
    super(id,'users')
  end

  def self.find_by(options)
    super(options,'users',self)
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

  def self.where(options)
    super(options,'users',self)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def save
    super('users',self)
  end

  def where(options)
    super(options,'users',self)
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
class QuestionFollow < ModelBase

  attr_accessor :user_id, :question_id

  def self.all
    super('question_follows')
  end

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
class Reply < ModelBase
  attr_accessor :id, :body, :user_id, :parent_id, :question_id

  def self.all
    super('replies')
  end


  def self.find_by_id(id)
    super(id,'replies')
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

  def self.where(options)
    super(options,'replies',self)
  end

  def self.find_by(options)
    super(options,'replies',self)
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @question_id = options['question_id']
  end

  def save
    super('replies',self)
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
class QuestionLike < ModelBase

  attr_accessor :user_id, :question_id

  def self.all
    super('question_likes')
  end

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