class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }
# /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{8,100}+\z/i

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :favorites_comments, through: :favorites, source: 'comment'
end
