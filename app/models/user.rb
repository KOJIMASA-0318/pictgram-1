class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true
  validates :password, length: {minimum: 8, maximum: 32}, format: {with:/\A[A-Za-z0-9]+\z/}
  validates :password_confirmation, length: {minimum: 8, maximum: 32}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
end
