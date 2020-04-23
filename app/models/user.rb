class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, presence: true

    has_many :recipes, dependent: :destroy 

    has_many :friendships 
    has_many :friends, through: :friendships 

    has_many :follows, class_name: "Friendship", foreign_key: "friend_id"
    has_many :followers, through: :follows, source: :user 
end
