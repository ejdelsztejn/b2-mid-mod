class AddAmusementParkToRide < ActiveRecord::Migration[5.1]
  def change
    add_reference :rides, :amusement_park, foreign_key: true
  end
end
