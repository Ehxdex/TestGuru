class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :author, class_name: 'User'

  def self.titles_by_category(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
