class RestaurantsController < ApplicationController
  before_action :set_resto, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @new_restaurant = Restaurant.new
  end

  def create
    @new_restaurant = Restaurant.new(set_params)

    if @new_restaurant.save
      redirect_to restaurant_path(@new_restaurant)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @restaurants.update(set_params)
  #   redirect_to restaurants_path
  # end

  # def destroy
  #   @restaurants.destroy
  #   redirect_to restaurants_path
  # end

  private

  def set_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_resto
    @restaurant = Restaurant.find(params[:id])
  end
end
