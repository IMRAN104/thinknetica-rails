class Schedule < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  validates :railway_station_id, uniqueness: { scope: :route_id, messege: "should be unique station within route" } 
end
