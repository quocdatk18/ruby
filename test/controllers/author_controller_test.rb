require "test_helper"

class AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get author_new_url
    assert_response :success
  end

  test "should get create" do
    get author_create_url
    assert_response :success
  end

  test "should get show" do
    get author_show_url
    assert_response :success
  end
end
