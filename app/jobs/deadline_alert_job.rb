class DeadlineAlertJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    @task = Task.find(task_id)
    send_deadline_alert(@task) if deadline_approaching?(@task) && !@task.done?
  end

  private

  def deadline_approaching?(task)
    now = Time.zone.now
    one_day_before = task.deadline - 1.day
    one_hour_before = task.deadline - 1.hour
    now.between?(one_hour_before, task.deadline) || now.between?(one_day_before, one_hour_before) || true
  end

  def send_deadline_alert(task)
    DeadlineAlertMailer.with(task: task).send_alert(task).deliver_now
  end
end