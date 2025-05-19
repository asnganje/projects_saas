class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = current_user.projects
    @tasks = @current_user.tasks
  end
end
