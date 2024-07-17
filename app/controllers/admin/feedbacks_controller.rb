class Admin::FeedbacksController < Admin::BaseController
  before_action :set_feedback, only: %i[show destroy]

  def index
    @feedback = Feedback.all
  end

  def show; end

  def destroy; end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
