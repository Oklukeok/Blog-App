require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get pages_hello_url
    assert_response :success
  end
end
