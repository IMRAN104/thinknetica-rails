class AddPassengerCarsToTrain < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :passenger_cars, :train
  end
end
