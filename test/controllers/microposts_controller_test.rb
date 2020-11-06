require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get Show" do
    get microposts_Show_url
    assert_response :success
  end

end
