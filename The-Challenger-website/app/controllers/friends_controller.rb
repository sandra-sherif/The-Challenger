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
    @user.increment!(:notifications)
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
    @friends = Friends.find(params[:id])
    if @friends.sent_by = current_user.id
      @user = User.find(@friends.sent_to)
    else
      @user = User.find(@friends.sent_by)
    end
    @friends.destroy
    redirect_to challenges_path, notice:  "You and #{@user.full_name} are no longer friends."
  end

  def accept
    @notification = Notification.find(params[:notification])
    @friends = Friends.find_by(:sent_to => current_user.id, :sent_by => @notification.sent_by)
    @friends.status = "Accepted"
    @user = User.find(@friends.sent_by)
    @notification.text = "You and #{@user.email} are now friends."
    @notification.notification_type = "Accepted Request Notification"
    @notification.save
    @acceptNotification = Notification.new
    @acceptNotification.sent_by = current_user.id
    @acceptNotification.sent_to = @user.id
    @acceptNotification.notification_type = "Accepted Request Notification"
    @acceptNotification.text = "#{current_user.email} has accepted your friend request."
    @user.increment!(:notifications)
    if @friends.save and @acceptNotification.save
      redirect_to notifications_path, notice: "You and #{@user.email} are now friends."
    else
      redirect_to notifications_path, notice: "Failed to accept the request."
    end
  end

  def reject
    @notification = Notification.find(params[:notification])
    @friends = Friends.find_by(:sent_to => current_user.id, :sent_by => @notification.sent_by)
    @friends.status = "Reject"
    @user = User.find(@friends.sent_by)
    @notification.text = "You have rejected a friend request from #{@user.email}."
    @notification.save
    if @friends.save
      redirect_to notifications_path, notice: "The friend request has been rejected."
    else
      redirect_to notifications_path, notice: "Failed to reject the request."
    end
  end

  private
  def friends_params
    params.require(:friends).permit(:sent_to, :sent_by, :status)
  end
end
