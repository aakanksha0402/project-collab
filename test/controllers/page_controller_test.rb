require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get page_landing_page_url
    assert_response :success
  end

end
