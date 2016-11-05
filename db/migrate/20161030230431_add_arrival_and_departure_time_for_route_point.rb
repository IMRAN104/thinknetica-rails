class AddArrivalAndDepartureTimeForRoutePoint < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :arrival, :time, default: '12:00:00'
    add_column :schedules, :departure, :time, default: '21:00:00'
  end
end
