class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

  private

  def authorize_admin!
    authorize Group, :admin?
  end

  def authorize_manager!
    authorize Group, :manager?
  end

  def authorize_group_manager!
    authorize Group, :group_manager?
  end

  def user_not_authorized
    render "errors/error", status: :forbidden
  end

end
