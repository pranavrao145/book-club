require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get book_view_url
    assert_response :success
  end
end
