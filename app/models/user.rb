class User < ApplicationRecord
    validates :user_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :birthday, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
    validates :mail_sub, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, uniqueness: true, length: { minimum: 8 }
    has_secure_password

    has_many :reviews

    # 与えられた文字列のハッシュ値を返す 
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
   end
end
