class CreateFxhistories < ActiveRecord::Migration[6.0]
  def change
    create_table :fxhistories do |t|
      t.string :currency
      t.string :rate
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
