class Taggings < ApplicationRecord
  validates :url_id, presence: true
  validates :tag_id, presence: true

  has_many :topics, class_name: :TagTopic, primary_key: :tag_id, foreign_key: :id
  has_many :urls, class_name: :ShortenedUrl, primary_key: :url_id, foreign_key: :id
end