class ResponsesController < ApplicationController
  def create
    @responses = Response.new(response_params)
    @challenge = Challenge.find(params[:challenge_id])
    @responses.challenge_id = @challenge.id
    @responses.challenge_owner = @challenge.user1_id
    @responses.user_id = current_user.id
    @responses.save
    if @responses.save
      redirect_to challenge_path(@challenge), notice: "The response has been sent."
    else
      redirect_to challenges_path
    end
  end

  def new
    @responses = Response.new
  end

  def index
    @responses = Response.all
  end

  def show
    @responses = Response.find(params[:id])
  end

  def destroy
    @responses = Response.find(params[:id])
    @responses.destroy
    redirect_to challenge_path(@responses.challenge_id), notice:  "The challenge #{@responses.name} has been deleted."
  end

    private
  def response_params
    params.require(:response).permit(:challenge_id, :name, :path, :upload_type)
  end

end
