class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start]

  rescue_from ActiveRecord::RecordNotFound, with: :record_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = set_user

    if @test.save
      redirect_to @test
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def start
    set_user.tests.push(@test)
    redirect_to set_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def record_test_not_found
    render plain: "Test Not Found"
  end
end
