class Api::V1::RestaurantsController < ApplicationController

  def index
    render json: Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(params[:name], params[:alias])

    if @restaurant.save
      render json: @restaurant
    else
      render json: { errors: @restaurant.errors.full_messages }, status: 422
    end
  end

end
