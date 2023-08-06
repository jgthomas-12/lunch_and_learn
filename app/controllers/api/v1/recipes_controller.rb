class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country]
    recipes = RecipesFacade.new.get_recipes(country)

    render json: RecipeSerializer.new(recipes)
  end
end