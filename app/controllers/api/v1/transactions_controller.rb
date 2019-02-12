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
    @transaction = Transaction.new(user_one_id: params[:user_one_id], user_two_id: params[:user_two_id], user_one_amount: params[:user_one_amount], user_two_amount: params[:user_two_amount], user_one_currency_symbol: params[:user_one_currency_symbol], user_two_currency_symbol: params[:user_two_currency_symbol])
    if @transaction.save
      render json: @transaction
    else
      render json: {error: "Unable to create transaction"}, status: 400
    end
  end

end
