require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "belongs to a certain Challenge" do
	comment = Comment.create("text" => "This is a test", "user_id"=> 1)
	assert_not comment.valid?, "Comment doesn't belong to a challenge"
end

test "belongs to a certain user" do
	comment = Comment.create("text" => "This is a test", "challenge_id"=> 1)
	assert_not comment.valid?, "Comment doesn't belong to a user"
end

test "has a text" do
	comment = Comment.create("challenge_id" => 1, "user_id"=> 1)
	assert_not comment.valid?, "Empty comment"
end

test "creates successfully" do
	comment = Comment.create("text" => "This is a test", "user_id"=> 1, "challenge_id"=> 1)
	assert comment.valid?, "Comment not created"
	assert comment.save, "Comment is not saved in the database"
end

end
