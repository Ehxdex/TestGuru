class User < ApplicationRecord
  has_many :tests, as: :author

  def tests_by(level)
    Test.where(level: level)
  end
end
