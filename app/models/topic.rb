class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  #image:carrierwave用に作ったカラム名,carrierwaveの設定ファイルのクラス名
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"
  
  has_many :comments
  
end
