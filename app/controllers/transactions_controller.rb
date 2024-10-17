class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[edit update destroy]

  def index
    @transactions = Current.user.transactions.includes(:account, :category)
  end

  def new
    @transaction = Current.user.transactions.build
  end

  def create
    @transaction = Current.user.transactions.build(transaction_params)

    if @transaction.record
      redirect_to transactions_path, notice: "Category created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @transaction.modify(transaction_params)
      redirect_to transactions_path, notice: "Category updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.remove!

    redirect_to transactions_path, notice: "Category deleted successfully!"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :name, :description, :amount).merge({ account:, category: }.compact)
  end

  def account
    Current.user.accounts.find_by(id: params.dig(:transaction, :account_id))
  end

  def category
    Current.user.categories.find_by(id: params.dig(:transaction, :category_id))
  end

  def set_transaction
    @transaction = Current.user.transactions.find(params[:id])
  end
end
