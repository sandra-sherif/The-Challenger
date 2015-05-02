class ProfileController < ApplicationController
 
#This action show sets the variable user to the current user signed in and gets all the challenges 
#poseted into a variable to be used later

 def show
   @user = current_user
   @challenges = Challenge.all
 end

# def delete_picture
# @user = current_user
# @user.delete_avatar
# end

# def removepicture_path
# current_user.delete_avatar
# '/profile/'
# end

end
