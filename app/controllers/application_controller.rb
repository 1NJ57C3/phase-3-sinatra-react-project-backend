require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The endpoint you want is actually \"/recipes\". :grimacing::smirk:" }.to_json
  end

  get "/recipes" do
    # Recipe.all.to_json( include: [ {ingredients: { only: [:name, :is_garnish]}}, {drinks: { only: [:measurements]}} ] )

    recipes = Recipe.all.map do |r|
      ingredients = r.ingredients.map(&:attributes)
      ingredients.map.with_index{|i,idx| i[:measurements] = r.drinks[idx].measurements}
      r.attributes.merge( {"ingredients" => ingredients} )
    end

    recipes.map do |r|
    #   # r["measurements"] = JSON.parse(r["measurements"])
      r["instructions"].class == String ? r["instructions"] = JSON.parse(r["instructions"]) : nil
    end

    recipes.to_json
  end

  post "/recipes" do
    r = Recipe.create(
      name: params[:name],
      prep_type: params[:prep_type],
      is_heated: params[:is_heated],
      prep_time: params[:prep_time],
      instructions: params[:instructions],
      source: params[:source],
      image: params[:image]
    )
    # binding.pry
    params[:ingredients].map do |i|
      Drink.create(
        recipe: r,
        ingredient: Ingredient.find_or_create_by(name: i[:name], is_garnish: i[:is_garnish], measurements: i[:measurements])
      )
    end
  end

  get "/ingredients" do
    Ingredient.all.to_json
  end
end
