class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  CRITERIAS = { "first_try" => Badges::FirstTrySpecification,
                "all_category" => Badges::AllCategorySpecification,
                "all_level" => Badges::AllLevelSpecification }

  def give_badge
    Badge.find_each do |badge|
      add_badge = CRITERIAS[badge.criteria].new(@test_passage)
      @test_passage.user.badges << badge if add_badge.is_satisfied_by?
    end
  end
end
