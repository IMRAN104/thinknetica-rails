class FirstClassCar < PassengerCar
  validates :lower_seats, numericality: { greater_than: 0 }
  validates_each :upper_seats, :upper_lateral_seats, 
    :lower_lateral_seats, :sitting_seats do |record, attr, value|
    record.errors.add(attr, 'must be equal zero for this type of car!') if value.to_i > 0
  end
end
