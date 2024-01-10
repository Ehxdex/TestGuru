class Test < ApplicationRecord
  def self.sorting_by(cat)
    joins("JOIN categories ON tests.category_id = categories.id WHERE categories.title = '#{cat}' ORDER BY tests.title DESC")
      .select(:title).map(&:title)    # .pluck(:title)
  end
end
