class User < ActiveRecord::Base
    has_secure_password
    has_many :entries
    has_many :entry_foods, through: :entries
    has_many :foods, through: :entry_foods

    validates :email, presence: true  
    validates :email, uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash['info']['email']
        self.where(email: oauth_email).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

end

