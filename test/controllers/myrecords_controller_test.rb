require 'test_helper'

class MyrecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myrecords_index_url
    assert_response :success
  end

end
