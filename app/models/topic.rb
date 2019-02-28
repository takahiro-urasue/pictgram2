class Topic < ApplicationRecord
  has_one_attached :image
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :favorite_users

  # mount_uploader :image, ImageUploader



  has_many :comments
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'



end
