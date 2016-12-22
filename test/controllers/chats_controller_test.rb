require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get comments" do
    get chats_comments_url
    assert_response :success
  end

end
