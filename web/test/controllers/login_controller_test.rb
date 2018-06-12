require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get logi" do
    get login_logi_url
    assert_response :success
  end

end
