class UserNotifier <ActionMailer::Base
	default from: "from@thechallenger.com"




def friend_requested (user_friendship_id)
	user_friendship = UserFriendship.find(user_friendship_id)

	@user = user_friendship.user
	@friend = user_friendship.friend

	mail to: @friend.email
	subject: "#{@user.full_name} want to be your friend"


end


def friend_requested_accepted (user_friendship_id)
	user_friendship = UserFriendship.find(user_friendship_id)

	@user = user_friendship.user
	@friend = user_friendship.friend

	mail to: @friend.email
	subject: "#{@user.full_name} has accepted your friend request"
	

end
end

