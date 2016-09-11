class Route < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains
end
