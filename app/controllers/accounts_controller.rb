class AccountsController < ApplicationController
  before_action :set_account, only: %i[edit update destroy]

  def index
    @accounts = Current.user.accounts
  end

  def new
    @account = Current.user.accounts.build
  end

  def create
    @account = Current.user.accounts.build(account_params)

    if @account.save
      redirect_to accounts_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: "Account updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy!

    redirect_to accounts_path, notice: "Account deleted successfully!"
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end

  def set_account
    @account = Current.user.accounts.find(params[:id])
  end
end
