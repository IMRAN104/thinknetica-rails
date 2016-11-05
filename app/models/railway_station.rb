class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :routes, through: :schedules

  validates :title, presence: true

  scope :ordered, ->(direction="ASC") { order('"schedules"."order" ' + direction) }
  scope :included, -> { includes(:schedules) }

  def update_position(route, position)
    schedule = schedule(route)
    schedule.update(order: position) if schedule
  end

  def update_time(route, arrival, departure)
    schedule = schedule(route)
    its_time = arrival.class == Time && departure.class == Time
    schedule.update(arrival: arrival, departure: departure) if schedule && its_time
  end

  def position_in(route)
    schedule(route).try(:order)
  end

  def arrival_time(route)
    schedule(route).arrival.strftime("%H:%M")
  end

  def departure_time(route)
    schedule(route).departure.strftime("%H:%M")
  end

  def schedule(route)
    @schedule ||= schedules.where(route: route).first
  end
end
