class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :authenticate_owner!, only: %i[ new create edit update destroy ]
  before_action :set_project, only: [ :destroy, :edit, :update, :show ]
  helper_method :limit_reached?

  def index
    if current_user.organization_owner?
      @pagy, @projects = pagy(Project.includes(:tasks), limit: 5)
    else
      @pagy, @projects = pagy(current_user.projects.includes(:tasks), limit: 5)
    end
  end

  def new
  end

  def show
    @q = @project.tasks.ransack(params[:q])
    if current_user.organization_owner? || current_user.has_role?(:team_leader)
      @pagy, @tasks = pagy(@q.result.incomplete_first, limit: 5)
    else
      @pagy, @tasks = pagy(@q.result.incomplete_first.where(assignee: current_user), limit: 5)
    end
  end

  def create
    if limit_reached?
      flash[:alert] = "Limit reached!"
      redirect_to projects_path
      return
    end
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_url, notice: "Project created!"
    else
      redirect_to projects_url, alert: @project.errors.full_messages.join("")
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_url, notice: "Project successfully edited"
    else
      redirect_to projects_url, alert: "Project could not be edited"
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_url, notice: "Project deleted successfully!"
  end

  def limit_reached?
    !current_user.payment_processor.subscribed? && Project.count >= 5
  end

  private
  def project_params
    params.require(:project).permit(:name, :team_id)
  end

  def set_project
    @project = if current_user.organization_owner?
      Project.find(params[:id])
    else
      current_user.projects.find(params[:id])
    end
  end
end
