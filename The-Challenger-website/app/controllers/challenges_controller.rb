class ChallengesController < ApplicationController
  before_filter :set_search
  
  def set_search
    @search = Challenge.search(params[:q])
  end

  # authored by Marina ElDib
  # def index returns all the challenges in the database and if someone search for certain challenges
  # it returns the searched challenges.
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
      if notification.challenge_id == @challenge.id
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
    redirect_to challenges_path, notice: "The challenge #{@challenge.name} has been deleted."
  end

# def show view a challenge with the input challenge id.
  def show
    @challenge = Challenge.find(params[:id])
  end

# this method is called by the admin in reports page to delete a challenge
  def delete_report
    if params[:upload_type] == "Challenge"
      @challenge = Challenge.find(params[:id])
      @notification = Notification.new
      @notification.sent_by = current_user.id
      @notification.sent_to = @challenge.user1_id
      @notification.notification_type = "Report Challenge Notification"
      @notification.text = "#{@challenge.name} has been removed by the admin."
      @notification.challenge_id = @challenge.id
      @user = User.find(@challenge.user1_id)
      @user.increment!(:notifications)
      @user.save
      @notification.save
      @report = Report.find_by(upload_type: "Challenge", user_id: @user.id, challenge_id: @challenge.id)
      @report.destroy
      @challenge.destroy
      redirect_to reports_path, notice: "Challenge has been deleted."
    else
      @response = Response.find(params[:id])
      @notification = Notification.new
      @notification.sent_by = current_user.id
      @notification.sent_to = @response.user_id
      @notification.notification_type = "Report Response Notification"
      @notification.text = "#{@response.name} has been removed by the admin."
      @notification.challenge_id = @response.challenge_owner
      @notification.response_id = @response.id
      @user = User.find(@response.user_id)
      @user.increment!(:notifications)
      @user.save
      @notification.save
      @report = Report.find_by(upload_type: "Response", user_id: @user.id, challenge_id: @response.id)
      @response.destroy
      @report.destroy
      redirect_to reports_path, notice: "Response has been deleted."
    end
  end

# def indexPrivateSharing
# @challenges = Challege.where(params[:user_id ,:sharing_with])
# end
#Default show Image method streams the file contents.
#File doesn't have to be in public/ dir
# def show
# send_file @image.filename, :type => @image.content_type,
# :disposition => 'inline'
# end
# Allows the view to access these attributes.
  private
  def challenge_params
    params.require(:challenge).permit(:name, :path, :user_id, :upload_type, :sharing_type, :sharing_with,
      :id, :report_id, :category)
  end
end
