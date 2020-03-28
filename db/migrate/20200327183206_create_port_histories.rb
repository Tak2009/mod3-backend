class CreatePortHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :port_histories do |t|
      t.float :local_amt
      t.float :home_amt
      t.integer :exchange_id
      t.timestamps
    end
  end
end
