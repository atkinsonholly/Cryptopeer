class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(username: params[:username], email: params[:email], password_digest: params[:digest], first_name: params[:first_name], last_name: params[:last_name], profile_pic_url: params[:profile_pic_url])
    if @user.save
      render json: @user
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end

end
