class BlockController < ApplicationController

	#authored by Marina ElDib
	#This method initializes a new  block
	def new
		@block = Block.new
	end

	#authored by Marina ElDib
	#This method creates the new block with the id of the user blocked and the id of the blocker and 
	#in both cases it redirects to the profile of the user to be blocked.
	#It takes as blocked_by the user signed in id and as blocked the id of the user to be blocked from 
	#the session
	def create_block
		@block = Block.new
		@block.blocked_by = current_user.id
		@block.blocked = session[:user_id]
		@user = User.find(session[:user_id])
		@block.save
		if @block.save
			redirect_to user_path, notice: "You have blocked #{@user.full_name}"
		else
			redirect_to user_path, notice: "The block for #{@user.full_name} wasn't saved"
		end
	end

	#authored by Marina ElDib
	#This method removes the block and also redirects to the user's profile, it finds by 
	#the current user id and the user to be unblocked id if the block exists and destroys it
	def destroy
		@block = Block.find_by(:blocked_by => current_user.id, :blocked => session[:user_id])
		@user = User.find(session[:user_id])
		@block.destroy
		if @block.destroy
			redirect_to user_path, notice: "You have unblocked #{@user.full_name}"
		else
			redirect_to user_path, notice: "Error occured while unblocking #{@user.full_name}"
		end
	end

	#authored by Marina ElDib
	#It allows the view to access these attributes
	private
	def block_params
		params.require(:block).permit(:blocked_by, :blocked)
	end

end
