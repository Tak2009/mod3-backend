class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.string :currency
      t.string :rate

      t.timestamps
    end
  end
end
