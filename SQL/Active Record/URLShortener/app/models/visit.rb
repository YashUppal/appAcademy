class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :shortened_url_id, presence: true

  def self.record_visit!(user,shortened_url)
    Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)
    # short_url = ShortenedUrl.find(shortened_url.id)
    # short_url.updated_at = Visit.last.shortened_url_id
    # short_url.save!
  end

  has_many :visitors, class_name: :User, primary_key: :user_id, foreign_key: :id
  has_many :urls, class_name: :ShortenedUrl, primary_key: :shortened_url_id, foreign_key: :id
end