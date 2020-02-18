class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find([:id])
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new()
  end

  def create
    @review = Review.new(review_params)
    @review.save

  # Add redirect_to
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comments)
  end

end
