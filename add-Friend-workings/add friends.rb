Class CreateAddFriends < Active Record::Migration
def change
	create_table :add_friends do |x|
		x.integer :user_id
		x.integer :friend_id

	end
	add_index :add_friends, [:user_id, :friend_id]
end
end 

