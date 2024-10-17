class AddDateIndexToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_index :transactions, :date
  end
end
