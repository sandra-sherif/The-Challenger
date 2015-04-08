class TaggingController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
	
def index #to list all challenges
 @challenges = Challenge.find(params[:challenge_id])
 end

# def new
# 		@tag = tag.new
# 	end

# to create a new challenge
	def create
		@challenge = Challenge.find(params[:challenge_id])
		@tag.challenge = @challenge.tag.create(params[:challenge_id])
		tag.save
    redirect_to challenge_path(@challenge)
end

# def show #to show challenges 
#   @tag= Tag.find(params[:id])
# end


end
