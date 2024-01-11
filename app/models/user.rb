class User < ApplicationRecord
  def tests_by(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
      .where(level: level, results: { author_id: id })
  end
end
