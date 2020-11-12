require 'test_helper'

class Articles::StrategiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get articles_strategies_show_url
    assert_response :success
  end

  test "should get index" do
    get articles_strategies_index_url
    assert_response :success
  end

  test "should get edit" do
    get articles_strategies_edit_url
    assert_response :success
  end

  test "should get create" do
    get articles_strategies_create_url
    assert_response :success
  end

end
