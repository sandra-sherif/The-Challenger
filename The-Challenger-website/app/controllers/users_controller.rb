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


#  def search
#   @search = User.search(params[:q])
#   @users = @search.result
#  end

# def index
#   @search = User.search(params[:q])
#   @users = @search.result
#  end

# def index
#   if params[:search]
#     @users = User.search(params[:search]).order("created_at DESC")
#   else
#     @users = User.order("created_at DESC")
#   end
# end

# def new 
# 	@user = User.new
# end

# def create
# 	@user = User.new(params[:user])
# 	if @user.save
# 		redirect_to @user
# 	else 
# 		render 'new'
# 	end
# end

  
end
