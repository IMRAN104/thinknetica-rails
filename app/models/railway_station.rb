class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :routes, through: :schedules

  validates :title, presence: true

  scope :ordered, ->(direction="ASC") { order('"schedules"."order" ' + direction) }
end
