class SetDefaultValueForPassengerCars < ActiveRecord::Migration[5.0]
  def change
    change_column_default :passenger_cars, :upper_seats, from: nil, to: 0
    change_column_default :passenger_cars, :lower_seats, from: nil, to: 0
    change_column_default :passenger_cars, :upper_lateral_seats, from: nil, to: 0
    change_column_default :passenger_cars, :lower_lateral_seats, from: nil, to: 0
    add_column :passenger_cars, :sitting_seats, :integer, default: 0
  end

end
