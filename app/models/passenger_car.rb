class PassengerCar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :kind, presence: true

  CARS_TYPE = ["open sleeping", 
               "sleepnig compartment"]
end
