require 'test_helper'

class AddFriendsTest <ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "Add a friend" do
		AddFriend.create user: users(:jason) , friend: 
	end

	test "Add friends using Id" 
	AddFriend.create user_id: users(:jason).id, friend_id: user(:mike).id
	assert users(:jason).friends.include?(users(:mike))