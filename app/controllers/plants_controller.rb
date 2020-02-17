class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.new()
  end

  def new
    @plant = Plant.new()
  end
end
