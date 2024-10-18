require "test_helper"

class ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:alex)
  end

  test "#index" do
    get imports_url

    assert_response :success
  end

  test "#new" do
    get new_import_url

    assert_response :success
  end

  test "#create" do
    assert_difference -> { users(:alex).imports.count } do
      post imports_url, params: { import: { file: fixture_file_upload("import.csv") } }
    end

    assert_redirected_to imports_url
  end
end
