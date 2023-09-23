require "rails_helper"

RSpec.describe Recipe do
  it "exits and has attributes" do
    country = "Australia"

    data = {
      recipe: {
        label: "PetroDragonic Apocalypse",
        url: "https://www.epicurious.com/recipes/food/views/hibiscus-tea-sorbet-230783",
        image: "https://www.smarmy.com/images/king-gizzard.jpg"
      }
    }

    recipe = Recipe.new(data, country)

    expect(recipe).to be_a(Recipe)

    expect(recipe.country).to be_a(String)
    expect(recipe.id).to be_a(String)
    expect(recipe.image_url).to be_a(String)
    expect(recipe.title).to be_a(String)
    expect(recipe.url).to be_a(String)

    expect(recipe.country).to eq(country)
    expect(recipe.id).to eq("null")
    expect(recipe.image_url).to eq(data[:recipe][:image])
    expect(recipe.title).to eq(data[:recipe][:label])
    expect(recipe.url).to eq(data[:recipe][:url])
  end
end
