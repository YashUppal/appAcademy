class Response < ApplicationRecord

    has_one :respondent, class_name: :User, primary_key: :user_id, foreign_key: :id
    has_one :answer_choice, class_name: :AnswerChoice, primary_key: :answer_choice_id, foreign_key: :id
end