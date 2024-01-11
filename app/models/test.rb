class Test < ApplicationRecord
  def self.sorting_by_categories(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category })
      .order("tests.title DESC")
      .pluck(:title)
  end
end
