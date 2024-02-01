class QuestionsController < ApplicationController
  def index
    @test = Test.find(test_params)
    render inline: "<ul><% @test.questions.each do |q| %>
                      <li><%= q.id %>. <%= q.body %></li>
                    </ul><% end %>"
  end

  def show
    @question = Question.find(question_params)

    render plain: @question.body
  end
  
  private

  def test_params
    params[:test_id]
  end
  
  def question_params
    params[:id]
  end
end
