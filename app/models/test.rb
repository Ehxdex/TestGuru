class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions

  def self.sort_by(category)
    Test.where(categories: { title: category}).joins(:category).order(title: :DESC).pluck(:title)
  end
end
