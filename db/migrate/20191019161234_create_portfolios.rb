class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.float :local_amt
      t.float :home_amt
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
