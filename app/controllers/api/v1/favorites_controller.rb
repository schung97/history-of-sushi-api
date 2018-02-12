class Api::V1::FavoritesController < ApplicationController

    def create
      fav = Favorite.new({ user_id: params[:user_id], restaurant_id: params[:restaurant_id]})

      if fav.save
        suggest = Suggestion.find(params[:suggestion_id])
        suggest.destroy
        user = User.find(params[:user_id])
        render json: user, status: :created
      end

    end

    def destroy
      fav = Favorite.find(params[:id])
      user = User.find(fav.user_id)

      if fav && fav.destroy
        render json: user, status: :ok
      else
        render json: { messsage: "Restaurant Not Deleted" }, status: :bad_request
      end

    end



end
