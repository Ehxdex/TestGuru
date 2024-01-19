class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests_by_level(level)
    Test.joins(:results)
      .where(level: level, results: { user_id: id })
  end
end
