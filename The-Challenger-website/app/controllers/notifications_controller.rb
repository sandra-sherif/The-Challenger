class NotificationsController < ApplicationController
  def show
  end

  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def destroy
  end

  def status
  end

    private
  def notification_params
    params.require(:notification).permit(:sent_by, :sent_to, :challenge_id, :comment_id, :text, :seen, :notification_type, :tag_id)
  end

end
