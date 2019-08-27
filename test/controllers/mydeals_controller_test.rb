require 'test_helper'

class MydealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mydeals_index_url
    assert_response :success
  end

  test "should get show" do
    get mydeals_show_url
    assert_response :success
  end

end
