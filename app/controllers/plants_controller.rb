class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def new
    @plant = Plant.new()
    authorize @plant
  end

  def create
    authorize @plant
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    @plant.save

    redirect_to plants_path
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
