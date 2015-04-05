require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



test " add a friend is working" do
users(:seif).friends << users (:sarah)
users(:seif).friends.reload
assert users (:seif).friends.include?(users(:sarah))
end

end
