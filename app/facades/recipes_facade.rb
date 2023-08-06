class RecipesFacade
  def get_recipes(country)
    request = service.get_all_recipes(country)

    @recipes = request[:hits].map do |hit|
      Recipe.new(hit, country)
    end
  end

  def service
    RecipeService.new
  end
end