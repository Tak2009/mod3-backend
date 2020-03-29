class CreatePortHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :port_histories do |t|
      t.float :home_amt
      t.datetime :value_date
      t.timestamps
    end
  end
end
