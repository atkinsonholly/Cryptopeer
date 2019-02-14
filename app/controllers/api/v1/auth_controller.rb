class Api::V1::AuthController < ApplicationController
     skip_before_action :authorized, only: [:login, :signup]

  def login
    @user = User.find_by(username: user_params[:username])
    # User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { token: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def signup
     @user = User.create!(user_params(:username, :email, :password, :first_name, :last_name, :profile_pic_url))
    # User#authenticate comes from BCrypt
    if @user.valid?
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { token: token}, status: :accepted
    else
      render json: { message: 'Could not create user', details: @users.errors.full_messages }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
