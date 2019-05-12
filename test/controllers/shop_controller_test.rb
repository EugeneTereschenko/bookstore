require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shop_new_url
    assert_response :success
  end

end
