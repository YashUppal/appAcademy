class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true
  validate :no_spamming
  validate :nonpremium_max
  
  belongs_to :submitter, class_name: :User, primary_key: :id, foreign_key: :user_id
  has_many :visits, class_name: :Visit, primary_key: :id, foreign_key: :shortened_url_id
  has_many :visitors,through: :visits, source: :visitors
  has_many :visitors_distinct, ->{distinct},through: :visits, source: :visitors
  has_many :taggings, class_name: :Taggings, primary_key: :id, foreign_key: :url_id
  has_many :tag_topics, through: :taggings, source: :topics

  def self.random_code
    code = ""
    while true
      code = SecureRandom::urlsafe_base64
      break unless self.exists?(short_url: code)
    end
    return code
  end

  def self.prune(n)
    # ShortenedUrl.where.not(created_at: (15.minutes.ago)..(Time.now.utc))
    # Visit.where.not(created_at: (15.minutes.ago)..(Time.now.utc)).map { |obj| obj.id }
    # return ShortenedUrl.where('id IN(?)', Visit.where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map { |obj| obj.id }).destroy_all
    # .not(created_at: (n.minutes.ago)..(Time.now.utc))
    # ShortenedUrl.all.map(&:visits)
    # "Visit.created_at BETWEEN (?) AND (?)", (n.minutes.ago),(Time.now.utc)
    # .where(created_at: ((n).minutes.ago)..(Time.now.utc))
    # ShortenedUrl.where('id IN(?)',Visit.where(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id))

    # ShortenedUrl.where("id NOT IN (?)",(Visit.all.map(&:shortened_url_id) + (Visit.joins(:urls).where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id)))).destroy_all

    # Visit.joins(:urls).where(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id)
    # Visit.joins(:urls).where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id)


    # ShortenedUrl.where("id IN (?)",(Visit.where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id) + ShortenedUrl.where.not(id: (ShortenedUrl.joins(:visits)))))

    # destroyed = ShortenedUrl.where("id NOT IN (?)",Visit.where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id)).destroy_all
    destroyed = ShortenedUrl.where("id NOT IN (?) AND user_id NOT IN (?)",Visit.where.not(created_at: (n.minutes.ago)..(Time.now.utc)).map(&:shortened_url_id), (Visit.where("user_id IN (?)",User.where(premium: true).map(&:id)).map(&:user_id)
    )).destroy_all
    destroyed.each do |obj|
      tags = obj.taggings
      tags.destroy_all

      visits = obj.visits
      visits.destroy_all
    end
  end

  def self.factory(user,long_url_string)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url_string, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    # self.visitors.distinct.count
    self.visitors_distinct.count
  end

  def num_recent_uniques
    self.visits.where({created_at:(10.minutes.ago)..(Time.now.utc)}).distinct.count
    # self.visits
  end

  def no_spamming
    creation_count = ShortenedUrl.where({created_at: (1.minute.ago)..(Time.now.utc),user_id: self.user_id}).count
    if creation_count >= 5
      errors.add("Please wait for sometime to create more urls")
    end
  end

  def nonpremium_max
    user_submit_count = ShortenedUrl.where(user_id: self.user_id).count
    if user_submit_count >= 5
      errors.add("Upgrade to save more than links") unless self.submitter.premium
    end
    # return user_submit_count
  end

end