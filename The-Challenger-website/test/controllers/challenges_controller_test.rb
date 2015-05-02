require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase

test "should create article" do
  assert_difference('Challenge.count') do
    post :create, challenge: {name: 'Some title'}
  end
 
  assert_redirected_to challenges_path(assigns(:challenge))
end

end
