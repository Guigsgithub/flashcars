class CreateCarPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :car_preferences do |t|
      t.integer :capacity
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
