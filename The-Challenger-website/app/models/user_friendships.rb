class UserFriendships <ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: 'User' , foregin_key:'friend_id'
	attr_accessible :user ,:friend , :user_id , :friend_id
end