class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :record_question_not_found
  
  def index
  end

  def show
  end
  
  def new
    @question = find_test.questions.build
  end

  def edit
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @question.update(question_params)
      redirect_to question_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @question.destroy

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

  def record_question_not_found
    render plain: "Question Not Found"
  end
end
