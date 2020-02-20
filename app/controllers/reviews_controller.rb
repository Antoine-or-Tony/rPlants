class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @plant = Plant.find(params[:plant_id])
    @review = Review.new()
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save
    authorize @review

    redirect_to user_path(current_user)
  end

  # No edit, update, destroy for reviews

  private

  def review_params
    params.require(:review).permit(:rating, :comments)
  end

end
