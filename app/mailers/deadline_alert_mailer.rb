class DeadlineAlertMailer < ApplicationMailer
  def send_alert(task)
    @task = task
    mail(to: @task.user.email, subject: "Task Deadline Approaching: #{@task.title}")
  end
end