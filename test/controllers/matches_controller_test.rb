require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  test "should get overview" do
    get :overview
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
