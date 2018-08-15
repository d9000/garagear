require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get sharing" do
    get :sharing
    assert_response :success
  end

  test "should get notifications" do
    get :notifications
    assert_response :success
  end

end
