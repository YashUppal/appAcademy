class CreateAnswerChoice < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.string :answer_choice
      t.integer :question_id
    end
  end
end
