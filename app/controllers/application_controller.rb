class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  protected

  def after_sign_up_path_for(_resource_or_scope)
    root_url
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_url
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
