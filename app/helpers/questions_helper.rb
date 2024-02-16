module QuestionsHelper
  def question_header
    "<#{@test.title}>"
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
