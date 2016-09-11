class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train
  belongs_to :begin_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'
end
