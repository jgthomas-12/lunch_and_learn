class RecipesFacade
  def get_recipes(country)
    request = service.get_all_recipes(country)

    @recipes = request[:hits].each do |hit|
      Recipe.new(hit, country)
    end
  end

  def service
    RecipeService.new
  end
end