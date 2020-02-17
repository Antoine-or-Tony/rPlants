class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.new()
  end

  def new
    @review = Review.new()
  end
end
