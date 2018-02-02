class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: auth_params[:username])
    if user && user.authenticate(auth_params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({user_id: user.id}, Figaro.env.secret_key_base, 'HS256')
      }
    else
      render json: { error: 'User not valid' }, status: :unauthorized
    end
  end

  def show
    if current_user
      render json: { id: current_user.id, username: current_user.username }
    else
      render json: { error: 'No id present on headers' }, status: :unauthorized
    end
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
