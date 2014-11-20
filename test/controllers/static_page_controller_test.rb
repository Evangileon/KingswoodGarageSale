require 'test_helper'

class StaticPageControllerTest < ActionController::TestCase
  test "should get ApplicationController" do
    get :ApplicationController
    assert_response :success
  end

end
