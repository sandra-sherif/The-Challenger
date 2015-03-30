require 'test_helper'

class PaintingsControllerTest < ActionController::TestCase
  test "should get _form" do
    get :_form
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
