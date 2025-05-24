require "test_helper"

class OrganizationUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organization_users_index_url
    assert_response :success
  end
end
