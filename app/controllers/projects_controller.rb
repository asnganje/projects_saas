class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :authenticate_owner!, only: %i[ new create edit update destroy ]
  before_action :set_project, only: [ :destroy, :edit, :update, :show ]

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
    @pagy, @tasks = pagy(@q.result.incomplete_first, limit: 5)
  end

  def create
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
