class AddStateToUserFriendship <ActiveRecord::Migration
	def change
		add_colum :user_friendships, :state, :string
		add_index :user_friendships, :state

	end
end
