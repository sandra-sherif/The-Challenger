class ProfileController < ApplicationController
 
 	#authored by Marina ElDib
	#This action show sets the variable user to the current user signed in and gets all the challenges 
	#posted into a variable to be used later
	def show
	  @user = current_user
	  @challenges = Challenge.all
	end

end
