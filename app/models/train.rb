class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :passenger_cars

  validates :number, presence: true

  def seats_count(car_type, seats_type)
    self.passenger_cars.where(type: car_type).sum(seats_type)
  end

  def self.find_suitable_train(begin_station, end_station)
    stations = [begin_station, end_station]
    @subquery_route = Schedule.select(:route_id)
                              .where(railway_station_id: stations)
                              .group(:route_id).having("count(id) > 1")

    @all_stations = Schedule.select(:route_id, :departure, :arrival)
                            .where(railway_station_id: stations)
                            .where("schedules.route_id IN (#{@subquery_route.to_sql})")

    @trains = Train.select(:id, :number, "MIN(schedules.departure) AS departure, MAX(schedules.arrival) AS arrival")
                   .where("trains.route_id IN (#{@subquery_route.to_sql})")
                   .joins("LEFT OUTER JOIN (#{@all_stations.to_sql}) AS schedules ON trains.route_id = schedules.route_id")
                   .group(:id, :number)

    ActiveRecord::Base.connection.execute(@trains.to_sql)
  end
end
