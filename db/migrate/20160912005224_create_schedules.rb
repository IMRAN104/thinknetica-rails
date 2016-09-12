class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :route_id
      t.integer :railway_station_id

      t.timestamps
    end
  end
end
