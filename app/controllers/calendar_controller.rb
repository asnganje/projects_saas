class CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enterprise_subscription!
  layout "admin"
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    if current_user.organization_owner?
      @tasks = Task.where(duedate: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    elsif current_user.has_role?(:team_leader)
      @tasks = Task.where(projects: current_user.projects, duedate: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    else
      @tasks = Task.where(assignee: current_user, duedate: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end
  end
end
