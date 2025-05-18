class UrgentTaskMailer < ApplicationMailer
  def urgent_task
    @user = params[:recipient]
    @urgent_task = params[:record]
    mail(to: @user.email, subject: "#{@urgent_task.name} is due today")
  end
end
