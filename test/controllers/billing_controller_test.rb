require "test_helper"

class BillingControllerTest < ActionDispatch::IntegrationTest
  test "should get portal" do
    get billing_portal_url
    assert_response :success
  end
end
