class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(freedback_params)
  
    if @feedback.save
      FeedbacksMailer.feedback_send(@feedback).deliver!
      redirect_to root_path, { notice: t('.success') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def freedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
