class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country]
    recipes = RecipesFacade.new.get_recipes(country)

    # require 'pry'; binding.pry
    render json: RecipeSerializer.new(recipes)
  end
end