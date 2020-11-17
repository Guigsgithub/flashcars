class RemoveAvailabilityFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :availability
  end
end