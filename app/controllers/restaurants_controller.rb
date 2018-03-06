class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant added successfully' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :'/restaurants/new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
