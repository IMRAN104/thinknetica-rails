class PassengerCar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :kind, presence: true
  
  before_save :default_values

  CARS_TYPE = ["open sleeping", 
               "sleepnig compartment"]

  scope :upper_count, -> { sum(:upper_seats) } 
  scope :lower_count, -> { sum(:lower_seats) } 

  private

  def default_values 
    self.upper_seats ||= 0
    self.lower_seats ||= 0
  end
end
