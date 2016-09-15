class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train
  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_staion_id

  validates :number, presence: true
end
