class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train
  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  before_validation :set_train, :set_number, :set_stations

  validates :number, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :passport, presence: true

  def station_name(station_id)
    RailwayStation.find(station_id).title
  end

  private

  def set_train
    self.train = Train.try(:find, train_id)
  end

  def set_number
    self.number = "#{self.train.number}-#{generate_random_number(5)}"
  end

  def set_stations
    self.begin_station = RailwayStation.try(:find, begin_station_id)
    self.end_station = RailwayStation.try(:find, end_station_id)
  end

  def generate_random_number(n)
    new_number = Random.rand(10**n - 10**(n-1)) + 10**(n-1)
  end
end
