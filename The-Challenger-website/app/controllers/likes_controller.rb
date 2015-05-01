class LikesController < ApplicationController

  #def create located and the challenge and create the like on it the challenge provided
  #afterwards it sends notification to inform the challenger's ownder of the like
  #and increments the number of likes by 1 and same goes for the response - Amr Nafie
  def create
  	if params[:upload_type] == "Challenge"
	  	@challenge = Challenge.find(params[:file_id])
	  	@like = Likes.new
	  	@like.path = @challenge.path
	  	@like.user_id = current_user.id
	  	if @challenge.user1_id != current_user.id
	  		@notification = Notification.new
		    @notification.sent_by = current_user.id
		    @notification.sent_to = @challenge.user1_id
		    @notification.notification_type = "Like Challenge Notification"
		    @notification.text = current_user.email + " liked your challenge."
		    @notification.challenge_id = @challenge.id
		    @notification.save
		    @user = User.find(@challenge.user1_id)
		    @user.increment!(:notifications)
		    @user.save
		end
	  	if @like.save
	  		redirect_to challenges_path, notice: "You liked #{@challenge.name}."
	  		@challenge.increment!(:likes_number)
	  		@challenge.save
	    else
	    	redirect_to challenges_path(@challenge), notice: "Unable to like #{@challenge.name}, Please Try Again."
	    end
	else
		@response = Response.find(params[:file_id])
	  	@like = Likes.new
	  	@like.path = @response.path
	  	@like.user_id = current_user.id
	  	if @response.user_id != current_user.id
	  		@notification = Notification.new
		    @notification.sent_by = current_user.id
		    @notification.sent_to = @response.user_id
		    @notification.notification_type = "Like Response Notification"
		    @notification.text = current_user.email + " liked your response."
		    @notification.challenge_id = @response.challenge_id
		    @notification.response_id = @response.id
		    @notification.save
		    @user = User.find(@response.challenge_owner)
		    @user.increment!(:notifications)
		    @user.save
		end
	  	if @like.save
	    	redirect_to :controller => 'responses', :action => 'index',  :challenge_id => @response.challenge_id, notice: "You liked #{@response.name}."
	    	@response.increment!(:likes_number)
	    	@response.save
	    else
	    	redirect_to challenges_path(@challenge), notice: "Unable to like #{@response.name}, Please Try Again."
	    end
	end
  end

  def new
  	@like = Likes.new
  end

  def index
  end

# def destroy deletes the like made by a certain user on a challenge or response - Amr Nafie
  def destroy
  	if params[:upload_type] == "Challenge"
	  	@like = Likes.find(params[:id])
	  	@challenge = Challenge.find_by(params[path: @like.path])
	  	if @like.destroy
	  		redirect_to challenges_path, notice: "You unliked #{@challenge.name}."
	  		@challenge.decrement(:likes_number, 1)
	  		@challenge.save
	  	else
	  		redirect_to challenges_path, notice: "Unable to unlike #{@challenge.name}, Please Try Again."
	  	end
	else
		@like = Likes.find(params[:id])
	  	@response = Response.find_by(params[path: @like.path])
	  	if @like.destroy
	  		redirect_to :controller => 'responses', :action => 'index',  :challenge_id => @response.challenge_id, notice: "You unliked #{@response.name}."
	  		@response.decrement(:likes_number, 1)
	  		@response.save
	  	else
	  		redirect_to :controller => 'responses', :action => 'index',  :challenge_id => @response.challenge_id, notice: "Unable to unlike #{@response.name}, Please Try Again."
	  	end
	end
  end

# def like_params provides the parameters needed for the functions - Amr Nafie
  private
  def like_params
    params.require(:likes).permit(:file_id,:user_id,:upload_type)
  end

end
