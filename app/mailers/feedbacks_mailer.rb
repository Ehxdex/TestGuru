class FeedbacksMailer < ApplicationMailer

  def feedback_send(feedback)
    @admin = Admin.last
    @feedback = feedback
  
    mail to: @admin.email
  end

end
