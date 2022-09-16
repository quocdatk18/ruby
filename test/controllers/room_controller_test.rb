require "test_helper"

class RoomControllerTest < ActionDispatch::IntegrationTest
  before { allow(controller).to receive(:current_user) { user } }

  test "should get index" do
    get room_index_url
    assert_response :success
  end
end
