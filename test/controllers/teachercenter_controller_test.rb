require 'test_helper'

class TeachercenterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get students" do
    get :students
    assert_response :success
  end

  test "should get courses" do
    get :courses
    assert_response :success
  end

  test "should get comments" do
    get :comments
    assert_response :success
  end

end
