class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  scope :easy_tests_by_level, -> { where(level: 0..1) }
  scope :medium_tests_by_level, -> { where(level: 2..4) }
  scope :hard_tests_by_level, -> { where(level: 5..Float::INFINITY) }

  scope :titles_by_category, ->(category) { 
    joins(:category)
      .where(categories: { title: category }) 
      .order(title: :desc)
      .pluck(:title)
  }
end
