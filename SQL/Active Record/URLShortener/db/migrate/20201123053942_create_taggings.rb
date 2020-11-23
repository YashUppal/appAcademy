class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.integer :url_id
      t.integer :tag_id
    end
  end
end
