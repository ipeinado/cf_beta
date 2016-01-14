class User < ActiveRecord::Base

    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name,
        presence: true,
        length: {
            minimum: 6,
            maximum: 50
        }
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }

    validates :password,
        length: { minimum: 6 },
        allow_blank: true

    validates :bio,
      length: { maximum: 255 }

    mount_uploader :avatar, AvatarUploader

    has_secure_password

    # Returns the hash digest of the given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
