class User < ApplicationRecord
    validates :username, presence: true, length: {maximum: 50},
                         uniqueness: true
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 254},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: true

end
