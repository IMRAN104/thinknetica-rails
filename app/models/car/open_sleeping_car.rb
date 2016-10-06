class OpenSleepingCar < PassengerCar
  validates :sitting_seats, numericality: { equal_to: 0 }
  validates_each :upper_seats, :upper_lateral_seats, 
    :lower_seats, :lower_lateral_seats do |record, attr, value|
    record.errors.add(attr, 'must be greater than zero for this type of car!') if value.to_i == 0
  end
end
