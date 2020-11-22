class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, presence: true
    end
    # add index
    add_index :users, :email, unique: true 

  end
end
