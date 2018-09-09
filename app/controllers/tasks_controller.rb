class TasksController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource :project, except: [:all_tasks]
  load_and_authorize_resource :task, through: :project, except: [:all_tasks]

  before_action :set_project, except: [:all_tasks]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_statuses, only: [:new, :edit, :update]
  before_action :project_users, only: [:new, :edit, :update]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)
    @task.user = current_user if current_user.developer?
    @statuses = Task.statuses.keys

    respond_to do |format|
      if @task.save
        format.html { redirect_to edit_project_task_path(@project, @task.id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        puts @task.errors.as_json
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.update_attribute(:status, 'deleted')
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all_tasks
    @tasks = Task.all
    @projects = Project.all
    @tasks = Task.where(project_id: params[:project_id]) if params[:project_id].present?
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find_by(id: params[:id])
      redirect_to project_tasks_path(@project.id), notice: "Task not found" if @project.nil?
    end

    def set_project
      if current_user.project_manager?
        @project = current_user.added_projects.find_by(id: params[:project_id])
      elsif current_user.developer?
        @project = current_user.projects.find_by(id: params[:project_id])
      end
      redirect_to projects_path, notice: "Project not found" if @project.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:status, :name, :description, :user_id)
    end

    def project_users
      @users = @project.users
    end

    def get_statuses
      @statuses = Project.statuses.keys
    end
end
