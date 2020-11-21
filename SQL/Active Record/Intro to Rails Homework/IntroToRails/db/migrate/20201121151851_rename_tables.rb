class RenameTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :house_tables, :houses
    rename_table :people_tables, :people
  end
end
