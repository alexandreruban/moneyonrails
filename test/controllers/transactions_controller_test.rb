require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)

    sign_in @user
  end

  test "#index" do
    get transactions_url

    assert_response :success
  end

  test "#new" do
    get new_transaction_url

    assert_response :success
  end

  test "#create" do
    assert_difference("@user.transactions.count") do
      post transactions_url, params: { transaction: { name: "Test", date: Date.current, amount: 100, account_id: accounts(:bnp).id } }
    end

    assert_redirected_to transactions_url
  end

  test "#edit" do
    get edit_transaction_url(transactions(:rent))

    assert_response :success
  end

  test "#update" do
    patch transaction_url(transactions(:rent)), params: { transaction: { name: "Rent!" } }

    assert_equal "Rent!", transactions(:rent).reload.name
    assert_redirected_to transactions_url
  end

  test "#destroy" do
    assert_difference("@user.transactions.count", -1) do
      delete transaction_url(transactions(:rent))
    end

    assert_redirected_to transactions_url
  end
end
