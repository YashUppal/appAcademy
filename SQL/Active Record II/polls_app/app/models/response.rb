class Response < ApplicationRecord
    belongs_to :respondent, class_name: :User, primary_key: :id, foreign_key: :user_id
    belongs_to :answer_choice, class_name: :AnswerChoice, primary_key: :id, foreign_key: :answer_choice_id
    has_one :question, through: :answer_choice, source: :question


    validates :user_id, presence: true
    validates :question_id, presence: true
    validates :answer_choice_id, presence: true
    validate :respondent_already_answered?
    validate :author_cant_respond_to_own_polls

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        errors.add(:user_id,"has already answered!") if self.sibling_responses.exists?(user_id: self.user_id)
    end

    def author_cant_respond_to_own_polls
        # response -> question -> poll -> author -> respondent
        poll_author_id = self.question.poll.author
        errors.add(:respondent,"cannot respond to own poll") if poll_author_id.id == self.user_id
    end

    
end
