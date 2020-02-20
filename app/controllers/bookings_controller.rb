class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new()
    @plant = Plant.find(params[:plant_id])
    @user = current_user
    # @start_date = params[:dates].split("|start:")[1].split("|end:")[0]
    # @end_date = params[:dates].split("|start:")[1].split("|end:")[1]
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @plant = Plant.find(params[:plant_id])
    @booking.total_price = (@booking.end_date - @booking.start_date) * @plant.price
    @booking.user = current_user
    @booking.plant = @plant
    if @booking.save
      authorize @booking
      redirect_to plant_bookings_path
      else
        render :new
      end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking

    # no need for app/views/restaurants/update.html.erb
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to bookings_path
  end

  def booking_params
    params.require(:booking).permit(:start_date,
                                  :end_date,
                                  :total_price)
  end


end
