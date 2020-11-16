class AddCapacityToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :capacity, :integer
  end
end
