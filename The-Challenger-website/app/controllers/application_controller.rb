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
