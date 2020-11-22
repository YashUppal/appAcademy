class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id
      t.string :long_url
      t.string :short_url
    end

    add_index :shortened_urls, [:user_id,:short_url]
  end
end
