class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :icon, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :icon, :password, :current_password)
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    elsif request.original_fullpath != home_path
      redirect_to home_path,
                  notice: 'Please Login to view that page!'
    end
  end
end
