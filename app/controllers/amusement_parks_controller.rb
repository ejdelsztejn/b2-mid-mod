class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @rides = Ride.where(amusement_park_id: @amusement_park.id).order(:name)
    @thrill_rating = Ride.where(amusement_park_id: @amusement_park.id).average(:thrill_rating).round(1)
  end
end
