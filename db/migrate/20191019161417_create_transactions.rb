class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :sell_amt
      t.string :buy_amt
      t.string :effectivefx
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
