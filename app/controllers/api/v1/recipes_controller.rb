class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == ""
      country = CountriesFacade.new.get_country
      recipes = RecipesFacade.new.get_recipes(country.name)

      render json: RecipeSerializer.new(recipes)
    else
      country = params[:country]
      recipes = RecipesFacade.new.get_recipes(country)

      render json: RecipeSerializer.new(recipes)
    end
  end
end
