require 'test_helper'

class PartialTestControllerTest < ActionController::TestCase
  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

end
