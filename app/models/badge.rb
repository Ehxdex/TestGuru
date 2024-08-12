class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image_url, presence: true, format: { with: URI::regexp(%w(http https)) }
  validates :rule, presence: true
  validates :criteria, presence: true

  enum criterias: %i[first_try all_category all_level]
end
