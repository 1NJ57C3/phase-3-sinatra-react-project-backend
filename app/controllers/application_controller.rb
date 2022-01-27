class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The endpoint you want is actually \"/recipes\". :grimacing::smirk:" }.to_json
  end

  get "/recipes" do
    recipes = Recipe.all.map.with_index do |r, i|
      r.attributes.merge({"ingredients" => r.ingredients.map(&:attributes)})
    end
    recipes.map do |r|
      r["measurements"] = JSON.parse(r["measurements"])
      r["instructions"] = JSON.parse(r["instructions"])
    end
    recipes.to_json
  end

  get "/ingredients" do
    Ingredient.all.to_json
  end
end
