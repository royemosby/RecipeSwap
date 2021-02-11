require 'rack-flash'

class RecipeController < ApplicationController
  use Rack::Flash

  get "/recipes" do
    @recipes = Recipe.all
      erb :"recipes/index"
  end

  post '/recipes' do
    if logged_in?
      @recipe = Recipe.new(params)
      @recipe.user = current_user
      @recipe.save
      flash[:message] = "Your recipe has been published!"
      redirect to "/recipes/#{@recipe.id}"
    else
      status 403
      flash[:message] = "You do not have permission to publish a recipe. Please log into RecipeSwap."
      erb :'recipes/error'
    end
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if @recipe.user_id == current_user.id
      @recipe.update(:name => params[:name],
                      :servings => params[:servings],
                      :description => params[:description],
                      :ingredients => params[:ingredients],
                      :instructions => params[:instructions])
      flash[:message] = "Your recipe has been updated!"
      redirect to "/recipes/#{@recipe.id}"
    else
      flash[:message] = "You do not have permission to make changes to this recipe."
      erb :'recipes/error'
    end


  end

  get '/recipes/new' do
    if logged_in?
      erb :'recipes/new'
    else
      status 403
      flash[:message] = "You have to be logged in to create a recipe."
      erb :'recipes/error'
    end
  end


  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    if logged_in? && @recipe.user_id == session[:user_id]
      erb :'recipes/edit'
    else
      status 403
      flash[:message] = "You do not have permission to make changes to this recipe."
      erb :'recipes/error'
    end
  end
end


