require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:alex)
  end

  test "#show" do
    get root_path

    assert_response :success
  end
end
