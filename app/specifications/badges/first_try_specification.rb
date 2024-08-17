module Badges
  class FirstTrySpecification < AbstractSpecification
    def is_satisfied_by?
      test_passages = TestPassage.where(test: @test_passage.test, user: @test_passage.user)
      test_passages.count == 1 && @test_passage.test_passed?
    end
  end
end
