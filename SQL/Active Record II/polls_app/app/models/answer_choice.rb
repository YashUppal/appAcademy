class AnswerChoice < ApplicationRecord
    belongs_to :question, class_name: :Question, primary_key: :id, foreign_key: :question_id
    has_many :responses, class_name: :Response, primary_key: :id, foreign_key: :answer_choice_id, dependent: :destroy

    validates :answer_choice, presence: true

    after_destroy :log_destroy_action

    def log_destroy_action
        puts "Answer Choice Destroyed!"
    end
end