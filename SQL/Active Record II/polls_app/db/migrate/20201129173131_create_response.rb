class CreateResponse < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_choice_id
    end
  end
end
