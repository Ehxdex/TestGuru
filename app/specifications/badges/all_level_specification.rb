module Badges
  class AllLevelSpecification < AbstractSpecification
    def is_satisfied_by?
      @test_passage.user.tests.where(level: @test_passage.test.level).uniq.count == Test.where(level: @test_passage.test.level).count
    end
  end
end
