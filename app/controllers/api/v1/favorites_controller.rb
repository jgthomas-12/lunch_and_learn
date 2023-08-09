class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { error: "Invalid API key" }, status: :unauthorized
    else
      favorites = user.favorites
      render json: FavoritesSerializer.new(favorites)
    end
  end

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
