class NotificationsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  def index
    @notifications = current_user.notifications
  end
end
