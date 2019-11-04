class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  validates :password_confirmation, length: {minimum: 8, maximum: 32}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
  has_many :comments
  
end

# https://qiita.com/mpyw/items/886218e7b418dfed254b　4項正規表現は右記を参照。