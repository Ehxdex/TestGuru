class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: [:index, :update_inline]
  before_action :set_test, only: [:show, :edit, :update, :destroy, :update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :record_test_not_found

  def index; end

  def show; end

  def new
    @test = current_user.tests.build
  end

  def create
    @test = current_user.tests_author.build(test_params)

    if @test.save
      redirect_to admin_tests_path, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def record_test_not_found
    render plain: "Test Not Found"
  end
end
