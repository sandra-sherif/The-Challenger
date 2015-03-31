require 'test_helper'

class UserFriendshipsControllerTest <ActionController::TestCase
	context "#new" do 
		context "when not logged in" do
		should "redirect to the login page" do
get :new
assert_response :redirect
			
	end

	end

	context "when logged in" do
		setup do
			sign_in users(:seif)
		end

		should "get new add return success" do
			get :new
			assert_response :success
	end	

	should "should set an error if the friend id is missing" do
	get :new, {}
	assert_equal "Choose a Friend", flash[:error]
end
should "display the friend's name" do
	get :new , friend_id: users(:sarah)
	assert_match /#{users(:sarah).full_name}/, response.body
	end

	should "assign a new friend" do
		get :new, friend_id: user(:sarah)
		assert assign (:user_friendship)
end
should "assign a new friend to the correct friend" do
		get :new, friend_id: user(:sarah)
		assert_equal user(:sarah), assign (:user_friendship).friend
end
should "assign a new friend to the correct logged in user" do
		get :new, friend_id: user(:sarah)
		assert_equal user(:seif), assign (:user_friendship).user

end

should "return 404 status if the friend is not found" 
get :new, friend_id: 'invalid friend'
assert_response :not_found
end
should "ask if you want to add this friend or not" do
	get :new, friend_id: users(:sarah)
	assert_match /Do you want to add #{users(:sarah).full_name}?/,response.body
end
end
context "#create" do
	context "when not logged in"do
	should "redirect to the login page" do
		get :new
		assert_response :redirect
		asser_redirected_to login_path
	end 
end

context "when logged in" do
	setup do
		sign_in users (:seif)
	end
	context "with no friend_id" do
		setup do
			post :create
		end
		should "set error msg" do
			assert !flash[:error].empty?
		end
		should "redirect to the root path" do
			assert_redirected_to root_path
		end

	end

	context "with a valid friend_id" do
		setup do
			post :create, user_friendship: {friend_id: users (:sarah)}
		end
		should "assign a friend" do
			assert assign(:friend)
			assert_equal users(:sarah), assign(:friend)
		end
		should "assign a userfriendship" do
			assert assign(:user_friendship)
			assert_equal users(:seif), assign(:user_friendship).friend

		end
		should "create a friendship" do
			assert users(:seif).friends.include?(users(:sarah))
		end 
		should "redirect to the profile of the friend" do
			assert_response :redirect
			assert_redirected_to profile_path(users(:sarah))
		end

		should "show a flash msg success of friendship" do
			assert flash[:success]
			assert_equal "You are now friends with #{users(:sarah)full_name}", flash[:success]
		end



end
end
end 