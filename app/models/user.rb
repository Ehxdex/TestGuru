class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
