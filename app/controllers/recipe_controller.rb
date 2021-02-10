require 'rack-flash'

class RecipeController < ApplicationController
  use Rack::Flash

  get "/recipes" do
    @recipes = Recipe.all
      erb :"recipes/index"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

end