require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, length: { minimum: 2 }, presence: true
  validates :email, presence: true, uniqueness: true

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  private

  def digest
    Digest::SHA1.hexdigest(string)
  end
end
