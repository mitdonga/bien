class User < ApplicationRecord
    has_secure_password

    validates :user_name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password_digest, uniqueness: true, presence: true
    
end
