require 'test_helper'

class CoursePagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get what_is_it" do
    get :what_is_it
    assert_response :success
  end

  test "should get alumni" do
    get :alumni
    assert_response :success
  end

  test "should get careers" do
    get :careers
    assert_response :success
  end

  test "should get vision" do
    get :vision
    assert_response :success
  end

  test "should get curriculum" do
    get :curriculum
    assert_response :success
  end

  test "should get research" do
    get :research
    assert_response :success
  end

end
