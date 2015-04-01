class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new(:id => params[:id])
  end

  def create
    @challenge = Challenge.new(params[:email, :path])
    if @challenge.save
      flash[:notice] = "Successfully created painting."
    else
      render :action => 'new'
    end
  end
end
