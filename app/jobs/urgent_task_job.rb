class UrgentTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActsAsTenant.without_tenant do
      urgent_tasks = Task.urgent
      urgent_tasks.each do |task|
        ActsAsTenant.with_tenant(task.organization) do
          UrgentTaskNotifier.with(record: task).deliver(task.assignee)
        end
      end
    end
  end
end
