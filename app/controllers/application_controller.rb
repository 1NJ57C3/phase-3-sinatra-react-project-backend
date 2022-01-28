require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "The endpoint you want is actually \"/recipes\". :grimacing::smirk:" }.to_json
  end

  get "/recipes" do
    recipes = Recipe.all.map do |r|
      ingredients = r.ingredients.map(&:attributes)
      ingredients.map.with_index{|i,idx| i[:measurements] = r.drinks[idx].measurements}
      r.attributes.merge( {"ingredients" => ingredients} )
    end
    recipes.map{|r| r["instructions"].class == String ? r["instructions"] = JSON.parse(r["instructions"]) : nil }
    recipes.to_json
  end

  get "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    ingredients = Recipe.find(params[:id]).ingredients.map(&:attributes)
    ingredients.map.with_index{|i,idx| i[:measurements] = recipe.drinks[idx].measurements}
    recipe = recipe.attributes.merge( {"ingredients" => ingredients} )
    recipe["instructions"].class == String ? recipe["instructions"] = JSON.parse(recipe["instructions"]) : nil
    recipe.to_json
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
    params[:ingredients].map do |i|
      Drink.create(
        recipe_id: r.id,
        ingredient: Ingredient.find_or_create_by(name: i[:ingred_name], is_garnish: i[:is_garnish]),
        measurements: i[:measurements]
      )
    end
  end

  patch "/recipes/:id" do
    r = Recipe.find(params[:id]).update(
      name: params[:name],
      prep_type: params[:prep_type],
      is_heated: params[:is_heated],
      prep_time: params[:prep_time],
      instructions: params[:instructions],
      source: params[:source],
      image: params[:image]
    )
    params[:ingredients].map do |i|
      Recipe.find(params[:id]).drinks.update(
        recipe_id: r.id,
        ingredient: Ingredient.find_or_create_by(name: i[:ingred_name], is_garnish: i[:is_garnish]),
        measurements: i[:measurements]
      )
    end
  end

  delete "/recipes/:id" do
    Recipe.find(params[:id]).delete
  end

  get "/ingredients" do
    Ingredient.all.to_json
  end
end
