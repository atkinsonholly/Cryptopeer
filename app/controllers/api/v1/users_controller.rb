class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    @user = current_user
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      @encoded_token = encode_token(user_id: @user.id)
      render json: { token: @encoded_token}
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :profile_pic_url)
  end

end
