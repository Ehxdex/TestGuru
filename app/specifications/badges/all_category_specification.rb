module Badges
  class AllCategorySpecification < AbstractSpecification
    def is_satisfied_by?
      @test_passage.user.tests.where(category: @test_passage.test.category).uniq.count == Test.where(category_id: @test_passage.test.category).count
    end
  end
end
