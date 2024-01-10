class Test < ApplicationRecord
  def self.sorting_by(cat)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where("categories.title = ?", cat)
      .order("tests.title DESC")
      .pluck(:title)
  end
end
