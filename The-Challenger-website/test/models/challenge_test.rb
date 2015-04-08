require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save challenge without path" do
  challenge = Challenge.new("name"=>"First article!", "upload_type"=>"Video")
  assert_not challenge.valid?, "Did not save the challenge without a path"
  end

  test "should not save challenge without name" do
  challenge = Challenge.new("path"=>"/challenge.mp4", "upload_type"=>"Video")
  assert_not challenge.save, "Did not save the challenge without a name"
  end

  test "should not save challenge without upload_type" do
  challenge = Challenge.new("path"=>"/challenge.mp4", "name"=>"Challenge")
  assert_not challenge.save, "Saved the challenge without a upload_type"
  end

  test "should save challenge normally" do
  challenge = Challenge.new("name"=>"Challenge", "path"=>"/challenge.mp4", "upload_type"=>"Video","user1_id"=>"1")
  challenge.path = "arrow.mp4"
  challenge.save
  puts challenge.name
  puts challenge.user1_id
  puts challenge.path
  puts challenge.upload_type
  assert challenge.valid?, "Did not save the challenge normally"
  end

  test "has an avatar" do
    challenge = challenge(:challenge_with_path)
    assert File.exists?(challenge.path.file.path)
  end

  test "uploads an avatar" do
    user = Challenge.create!(:path, fixture_file_upload('/files/Amr.jpg', 'image/jpg'))
    assert(File.exists?(challenge.path.file.path))
  end


end
