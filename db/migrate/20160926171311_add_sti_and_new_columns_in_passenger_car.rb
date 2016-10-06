class AddStiAndNewColumnsInPassengerCar < ActiveRecord::Migration[5.0]
  def change
    add_column :passenger_cars, :position, :integer
    add_column :passenger_cars, :type, :string
    add_column :passenger_cars, :upper_lateral_seats, :integer
    add_column :passenger_cars, :lower_lateral_seats, :integer
  end
end
