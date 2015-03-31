require 'test_helper'

class AddAFriendTest <ActionDispatch::IntegrationTestt
	def sign_in_as(user,password)
		post login_path, user: {email: user.email, password: password}
	end

test "that adding a friend works" do 
	sign_in_as user (:seif) , "12345"

	get "user_friendships/new?friend_id=#{users(:sarah).user_name}"
	assert_response :success
	
end


	end
