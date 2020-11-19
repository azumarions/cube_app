require 'test_helper'

class ClocksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get clocks_create_url
    assert_response :success
  end

  test "should get index" do
    get clocks_index_url
    assert_response :success
  end

  test "should get show" do
    get clocks_show_url
    assert_response :success
  end

  test "should get edit" do
    get clocks_edit_url
    assert_response :success
  end

end
