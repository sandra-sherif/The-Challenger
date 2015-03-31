Class CreateAddFriends < Active Record::Migration
def change
	create_table :add_friends do |t|
		t.integer :user_id
		t.integer :friend_id

	end
	add_index :add_friends, [:user_id, :friend_id]
end
end 

