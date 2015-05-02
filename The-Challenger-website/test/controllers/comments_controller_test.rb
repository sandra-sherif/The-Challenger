require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenge)
  end

  test "shows comment" do
   get(:show, {'comment_id' => 1}, {'user_id' => 5}, {'challenge_id' => 1}) 
    assert_response :success
  end

#  test "destroys comment" do
 #   assert_difference('Challenge.count', -1) do
  #    delete :destroy, id: @comment.id

end
