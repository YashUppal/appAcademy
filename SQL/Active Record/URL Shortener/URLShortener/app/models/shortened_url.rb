class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    def self.random_code
        code = ""
        while true
            code = SecureRandom::urlsafe_base64
            break unless self.exists?(short_url: code)
        end
        return code
    end

    def self.factory(user,long_url_string)
        self.create!(long_url: long_url_string, user_id: user.id, short_url: self.random_code)
    end

    belongs_to(:submitter,{
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id
        }
    )
end