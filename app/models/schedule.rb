class Schedule < ApplicationRecord
  belongs_to :routes
  belongs_to :railway_stations
end
