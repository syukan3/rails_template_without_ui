class ApplicationController < ActionController::Base
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production? or Rails.env.staging?


  before_action :authenticate_user!
  # before_action :forbidden_check
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    home_index_path
  end

  def forbidden_check
    return if controller_name == 'errors'
    if current_user.present?
      raise Forbidden unless current_user.permission_allow?(controller_name, permission)
    end
  end

  def permission
    case action_name
    when 'index', 'show', 'ajax_data'
      'read'
    when 'new', 'create', 'edit', 'update', 'unlock'
      'write'
    when 'destroy'
      'delete'
    when 'routing_error'
      nil
    else
      raise Forbidden
    end
  end

  protected

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
