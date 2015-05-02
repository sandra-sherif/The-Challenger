class UsersController < ApplicationController
  before_filter :set_search

  #authored by Marina ElDib
  #It sets @search to the results of the query for the search 
  def set_search
    @search = User.search(params[:q])
  end

  #This action gets all the challenges into a variable to be used later in the view and it also
  #gets the user with the id passed and stores into the variable user
  def show
    @user = User.find(params[:id])
    @challenges = Challenge.all
  end

  #authored by Marina ElDib
  #Index returns all users or the users searched for according to their full name
  def index
     @users = User.all
    if params[:q]
     @search = User.search(params[:q])
     @users = @search.result
    end
  end

end
