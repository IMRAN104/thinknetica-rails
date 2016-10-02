class PassengerCar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validate :uniqe_position

  before_save :set_position

  scope :seats_count, -> { select('SUM(passenger_cars.upper_seats) AS upper_seats, 
                                   SUM(passenger_cars.lower_seats) AS lower_seats,
                                   SUM(passenger_cars.upper_lateral_seats) AS upper_lateral_seats,
                                   SUM(passenger_cars.lower_lateral_seats) AS lower_lateral_seats,
                                   SUM(passenger_cars.sitting_seats) AS sitting_seats') }

  def self.list_of_types
    types = {}
    PassengerCar.subclasses.each do |subclass|
      types[subclass.name] = subclass.name.titlecase[/(.*)\s/,1]
    end
    types
  end

  private

  def uniqe_position
    car = self.train.passenger_cars.where(position: self.position)
    if car.present? && car.first != self
      errors.add(:passenger_cars, "not uniqe position within train!")
    end
  end

  def set_position
    positions = self.train.passenger_cars.map { |c| c.position.to_i }
    gap = (1...positions.max).detect { |p| positions.find_index(p).nil? }
    self.position ||= gap.nil? ? positions.max + 1 : gap
  end
end
