class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_project, only: [ :destroy, :edit, :update, :show ]

  def index
    @pagy, @projects = pagy(Project.all.includes(:tasks), limit: 5)
  end

  def new
  end

  def show
    @q = @project.tasks.ransack(params[:q])
    @pagy, @tasks = pagy(@q.result.incomplete_first, limit: 5)
  end

  def create
    @project = current_user.projects.build(project_params)
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
    params.require(:project).permit(:name)
  end

  def set_project
    @project=Project.find(params[:id])
  end
end
