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
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    authorize @booking

    redirect_to bookings_path
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

  # TO DO : create, destroy

  def booking_params
    params.require(:plant).permit(:start_date,
                                  :end_date,
                                  :total_price)
  end


end
