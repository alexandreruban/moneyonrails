require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)

    sign_in @user
  end

  test "#index" do
    get accounts_path

    assert_response :success
  end

  test "#new" do
    get new_account_path

    assert_response :success
  end

  test "#create" do
    assert_difference("@user.accounts.count", 1) do
      post accounts_path, params: { account: { name: "New account", balance: 1000 } }
    end

    assert_redirected_to accounts_path
  end

  test "#edit" do
    get edit_account_path(accounts(:bnp))

    assert_response :success
  end

  test "#update" do
    assert_changes("accounts(:bnp).reload.name", to: "BNP!") do
      patch account_path(accounts(:bnp)), params: { account: { name: "BNP!" } }
    end

    assert_redirected_to accounts_path
  end

  test "#destroy" do
    assert_difference("@user.accounts.count", -1) do
      delete account_path(accounts(:bnp))
    end

    assert_redirected_to accounts_path
  end
end
