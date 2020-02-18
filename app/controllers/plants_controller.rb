class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new()
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    @plant.save

    redirect_to user_path(@user)
  end

  private

  def plant_params
    params.require(:plant).permit(:name,
                                  :price,
                                  :weigth,
                                  :size,
                                  :species,
                                  :comments,
                                  :disponibility,
                                  :indoor_outdoor,
                                  :photo)
  end

# TO DO - destroy, edit, update

end
