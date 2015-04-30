class CommentsController < ApplicationController

	def new
    @comment = Comment.new
	end

	# def create locates the challenge that the user clicked on by retrieving its id
	# and then create the comment on that challenge by using the comment_params 
	# as the parameters needed for the creation and then the current user id is located
	# and saved in the new comment created and then it is saved and redirected to the challenge (Sandra)
	def create
    @challenge = Challenge.find(params[:challenge_id])
    @user = User.find(current_user.id)
    @comment = @challenge.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @notification = Notification.new
    @notification.sent_by = current_user.id
    @notification.sent_to = @challenge.user1_id
    @notification.challenge_id = @challenge.id
    @notification.comment_id = @comment.id
    @notification.notification_type = "Comment Notification"
    @notification.text = @user.email + " commented on " + @challenge.name
    @user1 = User.find(@challenge.user1_id)
    @user1.increment!(:notifications)
    if @notification.save
      redirect_to challenge_path(@challenge)
    end
  end

  # def destroy is the delete method, inwhich it locates the id of the specified challenge and comment 
  # and then destroy that comment (Sandra)
  def destroy
    @challenge = Challenge.find(params[:challenge_id])
    @comment = @challenge.comments.find(params[:id])
    @comment.destroy
    redirect_to challenge_path(@challenge)
  end

  # def index locates all the challenges  (Sandra)
 	def index
 	  @challenge = Challenge.find(params[:challenge_id])
 	end

  # def show locates the comment with the comment id (Sandra)
 	def show
 	  @comment = Comment.find(params[:id])
 	end

  # def comment_params provides the necessary attributes to create a comment (Sandra)
  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :challenge_id)
  end

end
