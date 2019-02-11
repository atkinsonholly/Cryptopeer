class UserCoinsController < ApplicationController

  def index
    @user_coins = UserCoin.all
    render json: @user_coins
  end

  def show
    @user_coin = UserCoin.find(params[:id])
    render json: @user_coin
  end

  def create
    @user_coin = UserCoin.new(user_id: params[user_id], coin_id: params[:coin_id], quantity: params[:quantity])
    if @user_coin.save
      render json: @user_coin
    else
      render json: {error: "Unable to create user_coin"}, status: 400
    end
  end

end
