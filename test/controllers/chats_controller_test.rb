require "test_helper"

class ChatsControllerTest < ActionDispatch::IntegrationTest
  before { allow(controller).to receive(:current_user) { user } }

  test "should get index" do
    get chats_index_url
    assert_response :success
  end
end
