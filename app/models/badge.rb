class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image_url, presence: true
  validates :role, presence: true
  validates :criteria, presence: true
end
