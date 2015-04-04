class TaggingController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
	
def index
  if params[:tag]
    @challenges = Challenge.tagged_with(params[:tag])
  else
    @challenges = Challenge.all
  end
end

def new
		@tag = tag.new
	end

	def create
		tag = current_user.Challenge.build(params[:text])
		tag.challenge = Challenge.find(params[:challenge_id])
		tag.save
end

