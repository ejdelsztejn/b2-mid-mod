class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
end
