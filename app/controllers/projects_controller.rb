class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_project, only: [:destroy]
  def index
    @projects = Project.all
  end

  def new
    
  end

  def create
    @project = current_user.projects.build(project_params)
    if(@project.save)
      redirect_to projects_url, notice:"Project created!"
    else
      redirect_to projects_url, alert:@project.errors.full_messages.join("")
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
