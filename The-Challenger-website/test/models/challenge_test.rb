require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save challenge without path" do
  challenge = Challenge.new("name"=>"First article!", "upload_type"=>"Video", "user1_id"=> 1)
  assert_not challenge.save, "Did not save the challenge without a path"
  end

  test "should not save challenge without name" do
  challenge = Challenge.new("path"=>"/challenge.mp4", "upload_type"=>"Video", "user1_id"=> 1)
  assert_not challenge.save, "Did not save the challenge without a name"
  end

  test "should not save challenge without upload_type" do
  challenge = Challenge.new("path"=>"/challenge.mp4", "name"=>"Challenge", "user1_id"=> 1)
  assert_not challenge.save, "Saved the challenge without a upload_type"
  end

  test "should not save challenge without user1_id" do
  challenge = Challenge.new("path"=>"/challenge.mp4", "name"=>"Challenge", "upload_type"=>"Video")
  assert_not challenge.save, "Saved the challenge without user1_id"
  end

  test "should save challenge normally" do
  challenge = Challenge.new("name"=>"Challenge", "path"=>"/challenge.mp4", "upload_type"=>"Video","user1_id"=>1)
  challenge.path = "arrow.mp4"
  assert_not_nil challenge.save, "Challenge was not saved to the database"

	end
end