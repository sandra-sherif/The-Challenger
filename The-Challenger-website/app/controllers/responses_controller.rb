# This method creates an instance of response model and adds to it the challenge and user id then creates
# a notification and adds to it the needed attributes then saves it and increment the notifications at the 
# user who receives the notification - Amr Nafie
class ResponsesController < ApplicationController

  def create
    @responses = Response.new(response_params)
    @challenge = Challenge.find(params[:challenge_id])
    @responses.challenge_id = @challenge.id
    @responses.challenge_owner = @challenge.user1_id
    @responses.user_id = current_user.id
    @notification = Notification.new
    @notification.sent_by = current_user.id
    @notification.sent_to = @responses.challenge_owner
    @notification.notification_type = "Response Notification"
    @notification.text = current_user.email + " has replied on one of your challenges."
    @notification.challenge_id = @responses.challenge_id
    @responses.save
    if @responses.save
      @notification.response_id = @responses.id
      @notification.save
      @user = User.find(@responses.challenge_owner)
      @user.increment!(:notifications)
      @user.save
      redirect_to challenge_path(@challenge), notice: "The response has been sent."
    else
      redirect_to new_challenges_path, notice: "Unable to upload your reply."
    end
  end

  def new
    @responses = Response.new
  end

  def index
    @responses = Response.all
  end

  def show
    @responses = Response.find(params[:id])
  end

# This method takes a notification and removes it from the report table and redirects to notifications page - Amr Nafie
  def destroy
    @responses = Response.find(params[:id])
    @notifications = Notification.all
    @notifications.each do |notification|
      if notification.response_id = @responses.id
        @notification = Notification.find(notification.id)
        if @notification.seen == false
          @user = User.find(@notification.sent_to)
          @user.decrement(:notifications, 1)
          @user.save
        end
        @notification.destroy
      end
    end
    @responses.destroy
    redirect_to challenge_path(@responses.challenge_id), notice:  "The challenge #{@responses.name} has been deleted."
  end

# def response_params provides the parameters needed for the functions - Amr Nafie
  private
  def response_params
    params.require(:response).permit(:challenge_id, :name, :path, :upload_type)
  end

end
