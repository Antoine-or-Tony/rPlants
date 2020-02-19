class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)


    @plants = Plant.where(
      indoor_outdoor: params[:indoor_outdoor],
      size: params[:size],
      delivery: params[:delivery])
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
    redirect_to plants_path
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    authorize @plant

    # no need for app/views/restaurants/update.html.erb
    redirect_to plants_path
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    authorize @plant
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
                                  :photo,
                                  :delivery)
  end

end
