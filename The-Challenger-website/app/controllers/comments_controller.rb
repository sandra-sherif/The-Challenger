class CommentsController < ApplicationController

	def new
    @comment = Comment.new
	end

	# def create locates the challenge that the user clicked on by retrieving its id
	# and then create the comment on that challenge by using the comment_params 
	# as the parameters needed for the creation and then the current user id is located
	# and saved in the new comment created and then it is saved and redirected to the challenge
	
	def create
    @challenge = Challenge.find(params[:challenge_id])
    @comment = @challenge.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to challenge_path(@challenge)
  	end

  	# def destroy is the delete method, inwhich it locates the id of the specified challenge and comment 
  	# and then destroy

  	def destroy
  		@challenge = Challenge.find(params[:challenge_id])
    	@comment = @challenge.comments.find(params[:id])
    	@comment.destroy
    	redirect_to challenge_path(@challenge)
  	end
 	
 	def index
 		@challenge = Challenge.find(params[:challenge_id])
 	end

 	def show
 		@comment = Comment.find(params[:id])
 	end

  private
    def comment_params

      params.require(:comment).permit(:text)
    end

end
