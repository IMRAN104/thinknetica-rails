class Route < ApplicationRecord
  has_many :trains
  has_many :schedules
  has_many :railway_stations, through: :schedules
  
  validates :title, presence: true
end
