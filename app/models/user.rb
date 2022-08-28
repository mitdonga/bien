class User < ApplicationRecord
    has_many :reviews
    has_many :comments

    has_secure_password

    validates :user_name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password_digest, uniqueness: true, presence: true

    def to_param
        user_name
    end
    
end
