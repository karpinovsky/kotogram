class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:username, :full_name]])
    devise_parameter_sanitizer.permit(:account_update, keys: [profile_attributes: [:avatar, :avatar_cache,
                                                              :remove_avatar, :username,
                                                              :full_name, :about_me]])
  end

  def render_404
    head :ok
  end
end
