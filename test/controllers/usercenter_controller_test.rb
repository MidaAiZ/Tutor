require 'test_helper'

class UsercenterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get courses" do
    get :courses
    assert_response :success
  end

  test "should get messages" do
    get :messages
    assert_response :success
  end

  test "should get more" do
    get :more
    assert_response :success
  end

end
