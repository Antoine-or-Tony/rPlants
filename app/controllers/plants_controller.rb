class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    @plant = Plant.find(params[:id])
    @reviews = @plant.reviews
    authorize @plant
  end

  def new
    @plant = Plant.new()
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    @plant.save
    authorize @plant
    redirect_to user_path(@plant.user)
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    authorize @plant

    redirect_to user_path(@plant.user)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    authorize @plant
    redirect_to user_path(@plant.user)
  end

  private

  def plant_params
    params.require(:plant).permit(:name,
                                  :price,
                                  :weigth,
                                  :size,
                                  :species,
                                  :comments,
                                  :disponibility_start,
                                  :disponibility_end,
                                  :indoor_outdoor,
                                  :photo)
  end

end
