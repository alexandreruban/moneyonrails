class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true

  def record
    return false unless valid?

    transaction do
      account.update!(balance: account.balance + amount)
      save!
    end
  end

  def modify(attributes)
    previous_account = account
    assign_attributes(attributes)
    new_account = account

    return false unless valid?

    transaction do
      previous_account.update!(balance: previous_account.balance - amount_was)
      new_account.update!(balance: new_account.balance + amount)
      save!
    end
  end

  def remove!
    transaction do
      account.update!(balance: account.balance - amount)
      destroy!
    end
  end
end
