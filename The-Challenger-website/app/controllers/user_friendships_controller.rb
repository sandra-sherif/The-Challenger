class UserFriendshipsController <ApplicationController
	before_filter :authenticate_user!, only: [:new]

	 
	#this code is the controller of sending request to make a new friendship by using the friend ID and making sure that it is the correct friend
	#If the friend is not selected it sends a flash message to choose a friend

	def new
		if params [:friend_id]
			@friend = User.where(email: (params[:friend_id]).first
				raise ActiveRecord::RecordNotFound if @friend.nil?
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else

			flash[:error] = "Choose a Friend"
			
		end

		#Here if the the friend ID is invaild it is caught by the test to direct it to Not found page
		rescue ActiveRecord::RecordNotFound
			render file: 'public/404' , status: :not_found

	end


#this code is used to create the friendship between the 2 users by saving the friendship and gives you a flash msg that the friend is added
#then it directs to the profile path of the friend
 

	def create
		if params [:user_friendship] && params [:user_friendship].has_key?(:friend_id)
			@friend = User.where(email:params [:user_friendship] [:friend_id]).first
			@user_friendship = current_user.user_friendships.new(friend: @friend)
			@user_friendship.save
			flash[:success] = "you are now friends with #{@friend.full_name}"
			redirect_to profile_path(@friend)
		else
			flash[:error] = "Friend required"
			redirect_to root_path
		end

end