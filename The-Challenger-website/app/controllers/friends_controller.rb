class FriendsController < ApplicationController
  def add_friend
    @friends = Friends.new
    @friends.sent_to = session[:user_id]
    @friends.sent_by = current_user.id
    @friends.status = "Pending"
    @user = User.find(session[:user_id])
    @notification = Notification.new
    @notification.sent_by = current_user.id
    @notification.sent_to = session[:user_id]
    @notification.notification_type = "Friend Request Notification"
    @notification.text = current_user.email + " wants to add you as a friend."
    @notification.save
    if @friends.save and @notification.save
      redirect_to @user, notice: "A friend request has been sent."
      session[:user_id] = nil
    else
      redirect_to user_path, notice: "A friend request has not been sent."
    end
  end

  def new
    @friends = Friends.new
  end

  def index
    @friends = Friends.all
  end

  def show
    @friends = Friends.find(params[:id])
  end

  def destroy
  end

  private
  def friends_params
    params.require(:friends).permit(:sent_to, :status, :sent_by)
  end
end
