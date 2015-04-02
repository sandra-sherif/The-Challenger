class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	
	def new
		@comment = comment.new
	end

	def create
		comment = current_user.Comments.build(params[:text])
		comment.challenge = Challenge.find(params[:challenge_id])
		comment.save
end
