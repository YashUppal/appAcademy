class Question < ApplicationRecord
    has_many :answer_choices, class_name: :AnswerChoice, primary_key: :id, foreign_key: :question_id
    belongs_to :poll, class_name: :Poll, primary_key: :id, foreign_key: :poll_id
    has_many :responses, through: :answer_choices, source: :responses
    
    validates :question, presence: true
    validates :poll_id, presence: true

    def results
        # options_hash = Hash.new { |h,k| h[k] = 0 }
        options_hash = {}
        answer_choices = self.answer_choices.includes(:responses)
        answer_choices.each do |choice|
            options_hash[choice.answer_choice] = choice.responses.length
        end

        return options_hash
    end

    def results_better
        self.answer_choices
            .left_outer_joins(:responses)
            .select("answer_choices.answer_choice,COUNT(responses.*)")
            .group("answer_choices.answer_choice")
            .pluck("answer_choices.answer_choice,COUNT(responses.*)")
            .to_h
    end
end