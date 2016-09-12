class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :routes, through: :schedules
end
