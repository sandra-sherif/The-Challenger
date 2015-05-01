class TagController < ApplicationController
  # Author :Sarah Ameer
  #This method defines the creation of a new tag by a user to another user in a certain challenge
  #if this tag is saved then it redirects to the challenges 
  #if not saved then it recreates the tag again 
   
   
    def create
        @tag = Tag.new(tag_params)
        @tag.tagged_by = session[:currrent_user.id]
        @user= User.find(session[:user_id])
  @challenge = Challenge.find(params[:challenge_id])
    @tag.save
    if @tag.save
      redirect_to challenges_path
    else
      render "new"
    end

	end
#this method defines a new tag
def new
    @tag = Tag.new
  end
  #this method untags a person that has been tagged 
  def destroy
  	@tag = Tag.find_by(:tagged_by => current_user.id, :tagged => session[:user_id])
  	@user = User.find(session[:user_id])
    @tag.destroy
    redirect_to tags_path
  end
  def index
    @tag = Tag.all
  end
  #Enables the view to access these attributes
  private
  def tag_params
		params.require(:tag).permit(:tagged_by, :tagged)
	end
end
