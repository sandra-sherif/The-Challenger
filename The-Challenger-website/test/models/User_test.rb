

test " add a friend is working" do
users(:seif).friends << users (:sarah)
users(:seif).friends.reload
assert users (:seif).friends.include?(users(:sarah))
end
