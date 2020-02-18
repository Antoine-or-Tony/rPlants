class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new()
  end

  def create

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to bookings_path
  end

  # TO DO : create, destroy
end
