class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :passenger_cars

  validates :number, presence: true

  def seats_count(car_type, seats_type)
    self.passenger_cars.where(type: car_type).sum(seats_type)
  end
end
