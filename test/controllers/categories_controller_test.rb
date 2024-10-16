require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)

    sign_in @user
  end

  test "#index" do
    get categories_path

    assert_response :success
  end

  test "#new" do
    get new_category_path

    assert_response :success
  end

  test "#create" do
    assert_difference("@user.categories.count", 1) do
      post categories_path, params: { category: { name: "New Category" } }
    end

    assert_redirected_to categories_path
  end

  test "#edit" do
    get edit_category_path(categories(:food))

    assert_response :success
  end

  test "#update" do
    assert_changes("categories(:food).reload.name", to: "Food!") do
      patch category_path(categories(:food)), params: { category: { name: "Food!" } }
    end

    assert_redirected_to categories_path
  end

  test "#destroy" do
    assert_difference("@user.categories.count", -1) do
      delete category_path(categories(:food))
    end

    assert_redirected_to categories_path
  end
end
