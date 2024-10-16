class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.date :date, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
