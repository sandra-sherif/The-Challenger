class ChallengesController < ApplicationController
before_filter :set_search

  def set_search
    @search = Challenge.search(params[:q])
  end

  # def index returns all the challenges in the database.
  def index
    @challenges = Challenge.all
    if params[:q]
      @search = Challenge.search(params[:q])
      @challenges = @search.result
    end
  end

  def new
    @challenge = Challenge.new
  end

  # def create takes params from the user.
  # Creates a new challenge with the given params then redirects to challanges view.
  # View a message that the challenge is uploaded if the challenge is actually saved or render the same view.
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user1_id = current_user.id
    if @challenge.save
      redirect_to challenges_path, notice: "The challenge #{@challenge.name} has been uploaded."
    else
      render "new"
    end
  end

  # def destroy deletes a challange with the input challenge id.
  # Redirects to the challenges view with a message that the file is deleted.
  def destroy
    @challenge = Challenge.find(params[:id])
    @notifications = Notification.all
    @notifications.each do |notification|
      if notification.challenge_id = @challenge.id
        @notification = Notification.find(notification.id)
        if @notification.seen == false
          @user = User.find(@notification.sent_to)
          @user.decrement(:notifications, 1)
          @user.save
        end
        @notification.destroy
      end
    end
    @challenge.destroy
    redirect_to challenges_path, notice:  "The challenge #{@challenge.name} has been deleted."
  end

  # def show view a challenge with the input challenge id.
  def show
    @challenge = Challenge.find(params[:id])
  end

  # Allows the view to access these attributes.
  private
  def challenge_params
    params.require(:challenge).permit(:name, :path, :user1_id, :upload_type)
  end

end
