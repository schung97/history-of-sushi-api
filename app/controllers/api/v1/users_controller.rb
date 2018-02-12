class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
    render json:  {
        user: UserSerializer.new(user),
        jwt: JWT.encode({user_id: user.id}, Figaro.env.secret_key_base, 'HS256')
      }, status: :created
      # render json: {status: 'User created successully' }, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])

    render json: user, status: :ok
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: { status: 'User updated successully' }, status: :ok
    end
  end

  def destroy
    user = User.find(params[:id])

    if user && user.destroy
      render json: { messsage: "Account Successfully Deleted" }, status: :ok
    else
      render json: { messsage: "Account Not Deleted" }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :joined_on)
  end


end
