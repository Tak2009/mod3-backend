class CreateFxhistories < ActiveRecord::Migration[6.0]
  def change
    create_table :fxhistories do |t|
      t.string :currency
      t.float :rate

      t.timestamps
    end
  end
end
