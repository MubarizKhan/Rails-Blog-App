# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end

  # def home; end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up)
  #   devise_parameter_sanitizer.permit(:account_update)
  # end
end
