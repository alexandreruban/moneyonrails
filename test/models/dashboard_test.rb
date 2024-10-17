require "test_helper"

class DashboardTest < ActiveSupport::TestCase
  setup do
    @dashboard = Dashboard.new(users(:alex))
  end

  test "#total_earnings" do
    assert_equal 2000, @dashboard.total_earnings
  end

  test "#total_expenses" do
    assert_equal 1060, @dashboard.total_expenses
  end

  test "#total_savings" do
    assert_equal 940, @dashboard.total_savings
  end

  test "#savings_rate" do
    assert_equal 47, @dashboard.savings_rate
  end

  test "#earnings_by_category" do
    assert_equal [
      Dashboard::CategoryLine.new(name: "Salary", amount: 2000, percentage: 100)
    ], @dashboard.earnings_by_category
  end

  test "#expenses_by_category" do
    assert_equal [
      Dashboard::CategoryLine.new(name: "Food", amount: 30, percentage: 3),
      Dashboard::CategoryLine.new(name: "Home", amount: 1000, percentage: 94),
      Dashboard::CategoryLine.new(name: "Uncategorized", amount: 30, percentage: 3)
    ], @dashboard.expenses_by_category
  end
end
