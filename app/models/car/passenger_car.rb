class PassengerCar < ApplicationRecord
  belongs_to :train
  validates :number, presence: true
  before_save :default_values

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

  def default_values 
    self.upper_seats ||= 0
    self.lower_seats ||= 0
  end
end
