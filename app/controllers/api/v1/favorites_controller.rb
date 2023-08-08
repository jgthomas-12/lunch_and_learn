class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: fav_params[:api_key])

    if user
      favorite = user.favorites.create(fav_params.except(:api_key))
      if favorite.save
        render json: { success: "Favorite added successfully" }, status: :created
      else
        render json: { error: favorite.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    else
      render json: { error: "Invalid api_key" }, status: :bad_request
    end
  end

  private

  def fav_params
    params.permit(:api_key, :country, :recipe_link, :recipe_title)
  end
end
