require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  before { allow(controller).to receive(:current_user) { user } }

  test "should get index" do
    get messages_index_url
    assert_response :success
  end

  test "should get new" do
    get messages_new_url
    assert_response :success
  end
end
