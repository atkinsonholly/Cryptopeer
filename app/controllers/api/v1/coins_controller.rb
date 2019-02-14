class Api::V1::CoinsController < ApplicationController
  skip_before_action :authorized, only: [:update_prices]
  
  def index
    @coins = Coin.all
    render json: @coins
  end

  def show
    @coin = Coin.find(params[:id])
    render json: @coin
  end

  def create
    @coin = Coin.create!(name: params[:name], symbol: params[:symbol], price: params[:price])
    if @coin.valid?
      render json: @coin
    else
      render json: {error: "Unable to create coin"}, status: 400
    end
  end

  def update_prices
    Coin.update_coins("USD")
    @coins = Coin.all
    render json: @coins
  end
end
