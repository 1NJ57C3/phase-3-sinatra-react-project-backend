require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The endpoint you want is actually \"/recipes\". :grimacing::smirk:" }.to_json
  end

  get "/recipes" do
    # Recipe.all.to_json(
    #   include: [
    #     {ingredients: { only: [:name, :is_garnish]}},
    #     {drinks: { only: [:measurements]}}
    #   ]
    # )

    recipes = Recipe.all.map do |r|
      ingredients = r.ingredients.map(&:attributes)
      ingredients.map.with_index{|i,idx| i[:measurements] = r.drinks[idx].measurements}
      r.attributes.merge( {"ingredients" => ingredients} )
    end

    recipes.map do |r|
    #   # r["measurements"] = JSON.parse(r["measurements"])
      r["instructions"] = JSON.parse(r["instructions"])
    end

    recipes.to_json
  end

  get "/ingredients" do
    Ingredient.all.to_json
  end
end
