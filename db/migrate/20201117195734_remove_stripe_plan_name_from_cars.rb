class RemoveStripePlanNameFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :stripe_plan_name
  end
end
