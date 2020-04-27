class User < ActiveRecord::Base
    has_secure_password
    has_many :daily_entries
    has_many :meals, through: :daily_entries
    has_many :foods, through: :meals

    validates :email, presence: true, message: 'Please enter a valid email address.'
    validates :email, uniqueness: true, message: 'This email is already in use.'

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash['info']['email']
        self.where(email: oauth_email).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end

