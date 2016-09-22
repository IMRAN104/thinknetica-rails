class Route < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :railway_stations, through: :schedules, -> { order "schedules.order ASC" }
  
  validates :title, presence: true
end
