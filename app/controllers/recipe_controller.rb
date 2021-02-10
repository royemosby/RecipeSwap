require 'rack-flash'

class RecipeController < ApplicationController
  use Rack::Flash

  get "/recipes" do
    @recipes = Recipe.all
      erb :"recipes/index"
  end
  
    get '/recipes/new' do
    if logged_in?
      erb :'recipes/new'
    else
      flash[:message] = "You have to be logged in to create a recipe."
      erb :'recipes/error'
    end
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

end