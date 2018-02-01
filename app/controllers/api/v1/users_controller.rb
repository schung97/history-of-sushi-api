class Api::V1::UsersController < ApplicationController

  def create

  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def update
    @user = User.find(params[:id])
    @user.update()
  end

  def destroy
    @user = User.find(params[:id])

    if @user && @user.destroy
      render json: { messsage: "Account Deleted" }
    else
      render json: { messsage: "Account Not Deleted" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :joined_on)
  end


end
