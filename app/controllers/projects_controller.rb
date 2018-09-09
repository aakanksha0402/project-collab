class ProjectsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_resources, :save_resources]
  before_action :get_statuses, only: [:new, :edit, :update]
  before_action :prepare_data, only: [:edit, :update]

  # GET /projects
  # GET /projects.json
  def index
    user = current_user
    if user.project_manager?
      @projects = Project.all
    elsif user.developer?
      @projects = user.projects
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.added_projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.added_projects.new(project_params)

    respond_to do |format|
      @statuses = Project.statuses.keys
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :index, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      @statuses = Project.statuses.keys
      if @project.update(project_params)
        format.html { redirect_to edit_project_path(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.update_attribute(:status, 'deleted')
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_resources
    @developers = User.developer
  end

  def save_resources
    user_ids = params[:project][:users].compact
    @project.user_ids = user_ids
  end

  def remove_resource
    user_ids = @project.user_ids
    removed_users = user_ids.delete(params[:user_id].to_i)

    @project.user_ids = user_ids

    render :save_resources
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.includes(:users).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_id, :status, :description, :name)
    end

    def get_statuses
      @statuses = Project.statuses.keys
    end

    def prepare_data
      @data = @project.prepare_data
    end
end
