class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find([:id])
  end

  def new
    @booking = Booking.new()
  end

  # TO DO : create, destroy
end
