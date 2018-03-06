class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]
  before_action :set_reviews, only: [:show]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id].to_i)
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      flash[:notice] = "Review added successfully"
    else
      flash[:notice] = "Rating can't be blank & Body can't be blank."
    end
    redirect_to restaurant_path(@restaurant.id)
  end

  private
    def set_reviews
      @restaurant = Restaurant.find(params[:id])
      @reviews = @restaurant.reviews
    end

    def review_params
      params.require(:review).permit(:body, :rating)
    end
end
