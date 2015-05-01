class ApplicationController < ActionController::Base
  
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.

#   before_action :configure_permitted_parameters, if: :devise_controller?
# def configure_permitted_parameters
#   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :age, :email, :password) }
# end

# def configure_permitted_parameters
#   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :age, :email, :password) }
# end

#This code redirects the user after signing in or signing up to his/her profile

def after_sign_up_path_for(user)
  '/profile/'
end

def after_sign_in_path_for(user)
  '/profile/'
end

# def removepicture_path(user)
# 	user.delete_avatar
# '/profile/'
# end

protect_from_forgery with: :exception
before_action :authenticate_user!

end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end
end
