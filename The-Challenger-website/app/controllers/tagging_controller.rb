class TaggingController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
	
def index
 @challenges = Challenge.find(params[:challenge_id])
 end

def new
		@tag = tag.new
	end


	def create
		@challenge = Challenge.find(params[:challenge_id])
		@tag.challenge = @challenge.tag.create(tag_params)
		tag.save
    redirect_to challenge_path(@challenge)
end

def show 
  @tag= Tag.find(params[:id])
end
private
def tag_params
  params.require(:tag).permit(:text)
  end
end
