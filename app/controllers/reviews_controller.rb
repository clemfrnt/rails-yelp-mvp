class ReviewsController < ApplicationController
  before_action :find_resto, only: [:new, :create, :show]
  def new
    @new_review = Review.new
  end

  def create
    @new_review = Review.new(params_settings)
    @new_review.restaurant = @restaurant
    if @new_review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @reviews = Review.all
  end

  private

  def params_settings
    params.require(:review).permit(:content, :rating)
  end

  def find_resto
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
