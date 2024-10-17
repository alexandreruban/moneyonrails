require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "#record saves the transaction in the database" do
    assert_difference -> { Transaction.count } do
      transactions(:rent).dup.record
    end
  end

  test "#record updates the account's balance" do
    assert_difference -> { accounts(:bnp).reload.balance }, -1000 do
      transactions(:rent).dup.record
    end
  end

  test "#modify updates the account's balance by the difference between the previous and the new amount" do
    assert_difference -> { accounts(:bnp).reload.balance }, 500 do
      transactions(:rent).modify(amount: -500)
    end

    assert_equal -500, transactions(:rent).amount
  end

  test "#modify updates balances when changing account" do
    assert_difference -> { accounts(:bnp).reload.balance }, 1000 do
      assert_difference -> { accounts(:citibank).reload.balance }, -1000 do
        transactions(:rent).modify(account: accounts(:citibank))
      end
    end
  end

  test "#modify updating both amount and account at the same time" do
    assert_difference -> { accounts(:bnp).reload.balance }, 1000 do
      assert_difference -> { accounts(:citibank).reload.balance }, -500 do
        transactions(:rent).modify(amount: -500, account: accounts(:citibank))
      end
    end

    assert_equal -500, transactions(:rent).amount
  end

  test "#remove! updates the account balance" do
    assert_difference -> { accounts(:bnp).reload.balance }, 1000 do
      transactions(:rent).remove!
    end
  end
end
