class RemoveColumnKindFromCars < ActiveRecord::Migration[5.0]
  def change
    remove_column :passenger_cars, :kind, :string
  end
end
