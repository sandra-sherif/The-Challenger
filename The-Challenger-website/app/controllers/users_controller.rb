class UsersController < ApplicationController

  before_filter :set_search
  
  def set_search
    @search = User.search(params[:q])
  end

  #This action gets all the challenges into a variable to be used later in the view and it also
  #gets the user with the id passed and stores into the variable user
	def show
    @user = User.find(params[:id])
    @challenges = Challenge.all
  end

  def index
     @users = User.all
    if params[:q]
     @search = User.search(params[:q])
     @users = @search.result
    end
  end

end
