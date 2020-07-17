class Mechanic < ApplicationRecord
  validates_presence_of :name, :years_of_experience

  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
end
