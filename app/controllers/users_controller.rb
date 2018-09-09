class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :project_manager!

  load_and_authorize_resource :User

  def index
    @users = User.all
  end

  def approve_user
    @user = User.find_by(id: params[:user_id])
    respond_to do |format|
      if @user.present?
        @user.update_attribute(:is_active, true)
        format.html { redirect_to users_path, notice: "#{@user.email} approved." }
      end
    end
  end

  private

  def project_manager!
    return unless current_user.project_manager?
  end
end
