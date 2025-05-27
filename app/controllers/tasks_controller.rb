class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authenticate_owner_or_team_leader!, only: %i[create update destroy]
  layout "admin"

  def index
    @tasks = Task.all
  end

  def show
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_url(@project), notice: "Task was successfully created." }
      else
        format.html { redirect_to project_url(@project), alert: @task.errors.full_messages.join("") }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_url(@project), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to project_url(@project), status: :see_other, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.expect(task: [ :completed, :name, :duedate, :completed_at, :priority, :project_id ])
    end
end
