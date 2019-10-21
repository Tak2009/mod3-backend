class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :sell_amt
      t.float :buy_amt
      t.float :effectivefx
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
