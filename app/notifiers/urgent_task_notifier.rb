# To deliver this notification:
#
# UrgentTaskNotifier.with(record: @post, message: "New post").deliver(User.all)

class UrgentTaskNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  deliver_by :email do |config|
    config.mailer = "UrgentTaskMailer"
    config.method = "urgent_task"
  end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
  notification_methods do
    def message
      "#{record.name} in #{record.project.name} is due today!"
    end

    def url
      project_path(record.project)
    end
  end
end
