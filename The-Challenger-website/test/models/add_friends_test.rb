require 'test_helper'

class AddFriendsTest <ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "Add a friend" do
		AddFriend.create user: users(:seif) , friend: 
	end
end
	test "Add friends using Id" do
	AddFriend.create user_id: users(:seif).id, friend_id: user(:sarah).id
	assert users(:sarah).friends.include?(users(:sarah))

end

context "a new insurance" do
	setup do
		@user_friendship = UserFriendship.new user: (:seif), friend: users(:sarah)
	end
	should "have a pending state" do
		assert_equal 'pending', @user_friendship
	end 
end

context "#send_request_email" do
	setup do
		@user_friendship = UserFriendship.new user: (:seif), friend: users(:sarah)

	end
	should "send an email" do
		assert_difference 'ActionMailer::Base.deliveries.size', 1 do
	@user_friendship.send_request_email
	end
end

end

context "#accept!" do
	setup do
		@user_friendship = UserFriendship.new user: (:seif), friend: users(:sarah)
	end

	should "set the state to accept" do
		@user_friendship.accept!
		assert_equal "accepted", @user_friendship.state
	end
should "send an acceptance email" do
	assert_difference 'ActionMailer::Base.delivers.size', 1 do
		@user_friendship.accept!
	end
end
end

end