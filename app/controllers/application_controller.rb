class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The endpoint you want is actually \"/recipes\". :grimacing::smirk:" }.to_json
  end

  get "/recipes" do
    # Recipe.all.to_json(include: :ingredients)
    # Recipe.all.to_json(include: { ingredients: { only: [:name, :is_garnish]}} )
    
    recipes = Recipe.all.map(&:attributes)
    
    recipes.map do |r|
      r["measurements"] = JSON.parse(r["measurements"])
      r["instructions"] = JSON.parse(r["instructions"])
    end

    recipes.to_json(include: { ingredients: { only: [:name, :is_garnish] }})
  end

  get "/ingredients" do
    Ingredient.all.to_json
  end
  
  # Courtesy of Grant: .attributes.to_json # Converts class instance to hashes
end
