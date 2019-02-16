class Api::V1::TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  def create

    user1CurrencySymbol = Coin.find(params[:trading_state][:user1CurrencyId]).symbol
    user2CurrencySymbol = Coin.find(params[:trading_state][:user2CurrencyId]).symbol
    @transaction = Transaction.create!(user_one_id: params[:trading_state][:user1Id],
                                      user_two_id: params[:trading_state][:user2Id],
                                      user_one_amount: params[:trading_state][:user1Amount],
                                      user_two_amount: params[:trading_state][:user2Amount],
                                      user_one_currency_symbol: user1CurrencySymbol,
                                      user_two_currency_symbol: user2CurrencySymbol,
                                      user_one_price: params[:trading_state][:user1Price],
                                      user_two_price: params[:trading_state][:user2Price])
    puts @transaction
    if @transaction.valid?
      @user1 = User.find(params[:trading_state][:user1Id])
      @user2 = User.find(params[:trading_state][:user2Id])

      @user1coindecrease = @user1.user_coins.find{|coin| coin.coin_id == params[:trading_state][:user1CurrencyId].to_i}
      @user1coindecreasequantity = @user1coindecrease.quantity - params[:trading_state][:user1Amount].to_f
      @user1coindecrease.update(quantity: @user1coindecreasequantity)

      @user1coinincrease = @user1.user_coins.find{|coin| coin.coin_id == params[:trading_state][:user2CurrencyId].to_i}
      @user1coinincreasequantity = @user1coinincrease.quantity + params[:trading_state][:user2Amount].to_f
      @user1coinincrease.update(quantity: @user1coinincreasequantity)


      @user2coindecrease = @user2.user_coins.find{|coin| coin.coin_id == params[:trading_state][:user2CurrencyId].to_i}
      @user2coindecreasequantity = @user2coindecrease.quantity - params[:trading_state][:user2Amount].to_f
      @user2coindecrease.update(quantity: @user2coindecreasequantity)

      @user2coinincrease = @user2.user_coins.find{|coin| coin.coin_id == params[:trading_state][:user1CurrencyId].to_i}
      @user2coinincreasequantity = @user2coinincrease.quantity + params[:trading_state][:user1Amount].to_f
      @user2coinincrease.update(quantity: @user2coinincreasequantity)
      @users = User.all
      render json: @users
    else
      render json: {error: "Unable to create transaction"}, status: 400
    end
  end

end
