class LikesController < ApplicationController
  def create
  	if params[:upload_type] == "Challenge"
	  	@challenge = Challenge.find(params[:file_id])
	  	@like = Likes.new
	  	@like.path = @challenge.path
	  	@like.user_id = current_user.id
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

   private
  def like_params
    params.require(:likes).permit(:file_id,:user_id,:upload_type)
  end

end
