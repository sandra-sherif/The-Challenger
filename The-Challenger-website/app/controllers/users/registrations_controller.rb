class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

 #  GET /resource/sign_up
 #  def new
#   super
 #  end

  # POST /resource
  #def create
  #   super
  #   redirect_to @user
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

 # addeb by me 
#  def sign_up_params
#    allow = [:email, :password, :password_confirmation, :first_name, :last_name, :age]
 #   params.require(resource_name).permit(allow)
  #end
  protected

  # def after_sign_up_path_for(resource)
  #   '/users/#{:id}'
  # end
  
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :first_name
  #   devise_parameter_sanitizer.for(:account_update) << :last_name
  #   devise_parameter_sanitizer.for(:account_update) << :age
  # end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :age, :password, :password_confirmation, :avatar, :email)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :age, :password, :password_confirmation, :current_password, :avatar, :email)
  end

  def after_update_path_for(user)
    profile_path
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
