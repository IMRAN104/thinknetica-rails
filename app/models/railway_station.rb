class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :routes, through: :schedules

  validates :title, presence: true

  scope :ordered, ->(direction="ASC") { order('"schedules"."order" ' + direction) }

  def update_position(route, position)
    schedule = schedule(route)
    schedule.update(order: position) if schedule
  end

  def position_in(route)
    schedule(route).try(:order)
  end

  def schedule(route)
    @schedule ||= schedules.where(route: route).first
  end
end
