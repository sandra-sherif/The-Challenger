class UsersController < ApplicationController
#This action gets all the challenges into a variable to be used later in the view and it also
#gets the user with the id passed and stores into the variable user
    
     @user = User.find(params[:id])
     @challenges = Challenge.all
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
