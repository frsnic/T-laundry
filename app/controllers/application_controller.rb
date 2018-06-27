class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter  :set_csrf_cookie_for_ng

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :login_do

  protected

  def configure_permitted_parameters
    added_attrs = %i(name email password password_confirmation remember_me)
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs + %i(current_password)
  end

  private

  def authenticate_user!
    render json: { is_login: false } unless current_user
  end

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

  def login_do
    Rails.logger.info "session[:current_user_id] #{session[:current_user_id]}"
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

end
