class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to dashboard_path, alert: "Invalid resource"
  end

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to dashboard_path, alert: exception.message
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
