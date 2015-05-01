require 'test_helper'
class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "should not save tag without selecting a user" do
  tag = Tag.new
  assert_not tag.save, "made a tag with no input user"
end
end