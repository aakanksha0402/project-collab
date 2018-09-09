module ControllerMacros
  def login_project_manager
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:project_manager)

    request.session[:user_id] = user.id
  end

  def login_developer
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:developer)

    request.session[:user_id] = user.id
  end
end
