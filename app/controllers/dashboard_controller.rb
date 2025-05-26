class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = Project.all
    @tasks = Task.all
  end
end
