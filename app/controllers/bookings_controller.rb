class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.new()
  end

  def new
    @booking = Booking.new()
  end
end
