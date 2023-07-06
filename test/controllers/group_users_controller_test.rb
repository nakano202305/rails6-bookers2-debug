require "test_helper"

class GroupUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get group_users_edit_url
    assert_response :success
  end
end
