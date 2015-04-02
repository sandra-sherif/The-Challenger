class UsersController < ApplicationController
#Added the def of users just to try it out
	 def show
     @user = User.find(params[:id])
   end

   	# def new 
   	# 	@user = User.new
   	# end

   	# def create
   	# 	@user = User.new(params[:user])
   	# 	if @user.save
   	# 		redirect_to @user
   	# 	else 
   	# 		render 'new'
   	# 	end
   	# end

end
