class Api::V1::CoinsController < ApplicationController

  def index
    @coins = Coin.all
    render json: @coins
  end

  def show
    @coin = Coin.find(params[:id])
    render json: @coin
  end

  def create
    @coin = Coin.new(name: params[:name], symbol: params[:symbol], price: params[:price])
    if @coin.save
      render json: @coin
    else
      render json: {error: "Unable to create coin"}, status: 400
    end
  end

end
