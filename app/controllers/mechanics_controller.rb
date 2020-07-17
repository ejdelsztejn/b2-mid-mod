class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create(ride_id: ride.id, mechanic_id: mechanic.id)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
