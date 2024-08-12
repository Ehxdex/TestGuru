class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def give_badge
    return [] unless @test_passage.test_passed?

    Badge.all.select do |badge|
      send("#{badge.criteria}".to_sym, Badge.criterias[badge.criteria])
    end
  end

  private

  def first_try(test_id)
    test_passages = TestPassage.where(test: @test, user: @user)
    test_passages.count == 1 && @test_passage.test_passed?
  end

  def all_category(category_id)
    category_test_ids = Test.where(category: category_id.to_i).pluck(:id)
    category_test_ids == completed_user_tests_ids(category_test_ids)
  end

  def all_level(level_id)
    level_test_ids = Test.where(level: level_id.to_i).pluck(:id)
    level_test_ids == completed_user_tests_ids(level_test_ids)
  end

  def completed_user_tests_ids(test_ids)
    @user.test_passages.where(test: test_ids).pluck(:test_id).uniq.sort
  end
end
