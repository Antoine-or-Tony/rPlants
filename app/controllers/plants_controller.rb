class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
    @plants_for_map = Plant.geocoded

    @markers = @plants_for_map.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plant: plant }),
        image_url: helpers.asset_url('marker.png')
      }
    end
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
                                  :weight,
                                  :size,
                                  :species,
                                  :comments,
                                  :disponibility_start,
                                  :disponibility_end,
                                  :indoor_outdoor,
                                  :photo)
  end

end
