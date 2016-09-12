class Route < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains
  has_many :schedules
  has_many :railway_stations, through: :schedules
end
