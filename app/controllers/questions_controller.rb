class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  
  def index 
  end

  def show
  end
  
  def new
  end

  def create
    @test.questions.create(question_params)
    
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted"

    redirect_to test_questions_path(@question.test.id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end
end
