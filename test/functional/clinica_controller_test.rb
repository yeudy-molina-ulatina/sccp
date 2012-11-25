require 'test_helper'

class ClinicaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
