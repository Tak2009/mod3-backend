class CreateFxhistories < ActiveRecord::Migration[6.0]
  def change
    create_table :fxhistories do |t|
      t.string :currency
      t.string :rate

      t.timestamps
    end
  end
end
