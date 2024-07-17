class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(freedback_params)
  
    if @feedback.save
      # send message
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def freedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
