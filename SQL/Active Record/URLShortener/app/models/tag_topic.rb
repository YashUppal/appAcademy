class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true
  has_many :taggings, class_name: :Taggings, primary_key: :id, foreign_key: :tag_id
  has_many :urls, through: :taggings, source: :urls

  def popular_links
    text = []
    self.urls.sort_by(&:num_clicks).reverse[0..5].each do |url_obj|
       text << "#{url_obj.long_url} has been clicked #{url_obj.num_clicks} times"
    end
    puts text
  end
end