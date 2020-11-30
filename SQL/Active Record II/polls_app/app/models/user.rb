class User < ApplicationRecord
  has_many :authored_polls, class_name: :Poll, primary_key: :id, foreign_key: :author_id
  has_many :responses, class_name: :Response, primary_key: :id, foreign_key: :user_id

  validates :username, uniqueness: true, presence: true

  def completed_polls
    # user -> responses -> question -> poll
    
    user_answered = self.responses.joins(:question).select("questions.poll_id,COUNT(questions.poll_id)").group("questions.poll_id").pluck("questions.poll_id,COUNT(questions.poll_id)").to_h
    

    polls_questions_count = Poll.where("polls.id IN (?)",user_answered.keys).joins(:questions).select("polls.id, COUNT(questions.id)").group("polls.id").pluck("polls.id,COUNT(questions.id)").to_h

    completed_polls = []

    user_answered.each do |poll_id, count|
      completed_polls << poll_id if user_answered[poll_id] == polls_questions_count[poll_id]
    end

    return Poll.where("polls.id IN (?)",completed_polls)

  end
end

# u1.responses.joins(:question).select("questions.*,responses.*").pluck(:poll_id)