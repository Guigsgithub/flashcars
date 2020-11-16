class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.date :availability
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
