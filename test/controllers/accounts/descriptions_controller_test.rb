require 'test_helper'

class Accounts::DescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get accounts_descriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get accounts_descriptions_update_url
    assert_response :success
  end

end
