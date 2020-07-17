class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
  end
end
