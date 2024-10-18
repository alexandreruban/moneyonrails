class Dashboard
  def initialize(user)
    @user = user
  end


  def total_earnings
    categorized_earnings + uncategorized_earnings
  end

  def total_expenses
    categorized_expenses + uncategorized_expenses
  end

  def total_savings
    total_earnings - total_expenses
  end

  def savings_rate
    (total_savings * 100 / total_earnings).round
  end


  def earnings_by_category
    amount_by_category.select { |category, _| category.income? }.map do |category, amount|
      CategoryLine.new(name: category.name, amount: amount, percentage: (amount * 100 / total_earnings).round)
    end
  end

  def expenses_by_category
    amount_by_category.select { |category, _| category.expense? }.map do |category, amount|
      CategoryLine.new(name: category.name, amount: - amount, percentage: (- amount * 100 / total_expenses).round)
    end
  end

  private

  def amount_by_category
    @amount_by_category ||= amount_by_category_excluding_uncategorized.merge(
      Category.new(name: "Uncategorized", income: true) => uncategorized_earnings,
      Category.new(name: "Uncategorized", income: false) => - uncategorized_expenses
    ).reject { |_, amount| amount.zero? }
  end

  def amount_by_category_excluding_uncategorized
    @amount_by_category = user.transactions.joins(:category).group(:category).sum(:amount)
  end

  def categorized_earnings
    @categorized_earnings ||= user.transactions.joins(:category).where(categories: { income: true }).sum(:amount)
  end

  def uncategorized_earnings
    @uncategorized_earnings ||= uncategorized_transactions.where("amount > 0").sum(:amount)
  end

  def categorized_expenses
    @categorized_expenses ||= - user.transactions.joins(:category).where(categories: { income: false }).sum(:amount)
  end

  def uncategorized_expenses
    @uncategories_expenses ||= - uncategorized_transactions.where("amount < 0").sum(:amount)
  end

  def uncategorized_transactions
    user.transactions.where.missing(:category)
  end

  attr_reader :user

  CategoryLine = Data.define(:name, :amount, :percentage) do
    def to_partial_path = "dashboards/category_line"
  end
end
