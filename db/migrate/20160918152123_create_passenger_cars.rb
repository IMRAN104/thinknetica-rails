class CreatePassengerCars < ActiveRecord::Migration[5.0]
  def change
    create_table :passenger_cars do |t|
      t.string :number
      t.integer :seats
      t.string :kind

      t.timestamps
    end
  end
end
