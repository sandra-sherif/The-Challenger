class ProfileController < ApplicationController

	def show
     @user = current_user
   end


     @challenges = Challenge.all
   end

   # def delete_picture
   # 	@user = current_user
   # 	@user.delete_avatar
   # end

#   def removepicture_path
# 	current_user.delete_avatar
# '/profile/'
# end

end
