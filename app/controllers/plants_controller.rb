class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)

    @plants = @plants.all
    @plants_for_map = Plant.geocoded


    if (params[:query].present? || params[:indoor_outdoor].present? || params[:address].present?)
      # Si j ai un params query => premiere filtre
      if params[:query].present?
        @plants = @plants.search_by_name_and_species(params[:query])
        @plants_for_map = @plants_for_map.search_by_name_and_species(params[:query])
      end

      # Si j ai un params indoor or outdoor => scd filtre
      if params[:indoor_outdoor].present?
        @plants = @plants.search_by_indoor_outdoor(params[:indoor_outdoor])
        @plants_for_map = @plants_for_map.search_by_indoor_outdoor(params[:indoor_outdoor])
      end

      # Si j ai un params address => scd filtre
      if params[:address].present?
        @plants =@plants.near(params[:address], 10)
        @plants_for_map = @plants_for_map.near(params[:address], 10)
      end
    else
      @plants = @plants.all
      @plants_for_map = Plant.geocoded
    end

    @markers = @plants_for_map.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @booking = Booking.new
    authorize @booking
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
