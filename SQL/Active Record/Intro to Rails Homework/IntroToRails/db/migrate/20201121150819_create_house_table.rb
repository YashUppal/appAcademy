class CreateHouseTable < ActiveRecord::Migration[6.0]
  def change
    create_table :house_tables do |t|
      t.string :address
    end
  end
end
