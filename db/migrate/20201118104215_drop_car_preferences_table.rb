class DropCarPreferencesTable < ActiveRecord::Migration[6.0]
 def up
    drop_table :car_preferences
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end


