should have_many :Addfriends
should have_many :friends

test " add a friend is working"
users(:jason).friends << users (:mike)
users(:jason).friends.reload
assert users (:jason).friends.include?(users(:mike))