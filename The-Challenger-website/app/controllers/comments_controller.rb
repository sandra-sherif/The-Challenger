class CommentsController < ApplicationController

	def create
    @challenge = Challenge.find(params[:challenge_id])
    @comment = @challenge.comments.create(comment_params)
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
