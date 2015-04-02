class ChallengesController < ApplicationController
  def index
  	@challenges = Challenge.all
  end

  def new
  	@challenge = Challenge.new
  end

  def create
  	 @challenge = Challenge.new(challenge_params)
     @challenge.user1_id = current_user.id
    if @challenge.save
      redirect_to challenges_path, notice: "The challenge #{@challenge.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
  	@challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path, notice:  "The challenge #{@challenge.name} has been deleted."
  end

  def find
    redirect_to challenges_path, notice:  "The challenge #{@challenge.name} has been found."
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :path, :user1_id)
  end

end
