class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  #image:carrierwave用に作ったカラム名,carrierwaveの設定ファイルのクラス名
end
