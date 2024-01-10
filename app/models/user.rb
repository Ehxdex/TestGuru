class User < ApplicationRecord
  def tests_by(level)
    Test.where(level: level)
  end
end
