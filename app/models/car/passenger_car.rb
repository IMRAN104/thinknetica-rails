class PassengerCar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validate :uniqe_position

  before_save :set_position

  scope :upper_count, -> { sum(:upper_seats) }
  scope :lower_count, -> { sum(:lower_seats) }

  def self.list_of_types
    types = {}
    PassengerCar.subclasses.each do |subclass|
      types[subclass.name] = subclass.name.titlecase[/(.*)\s/,1]
    end
    types
  end

  private

  def uniqe_position
    if self.train.passenger_cars.where(position: self.position).empty?
      errors.add(:passenger_cars, "Not uniqe position of passenger car within train!")
    end
  end

  def set_position
    positions = self.train.passenger_cars.map { |c| c.position.to_i }
    gap = (1...positions.max).detect { |p| position.find_index(p).nil? }
    self.position ||= gap.nil? ? positions.max + 1 : gap
  end
end
