class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true, length: { minimum: 2 }
    validates :password_confirmation, presence: true
    has_many :todos, dependent: :destroy
end
