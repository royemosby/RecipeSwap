require 'rack-flash'

class RecipeController < ApplicationController
  use Rack::Flash

  get "/recipes" do
    @recipes = Recipe.all
      erb :"recipes/index"
  end

  post '/recipes' do #also handles spinoffs
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
      flash[:message] = "You have to have an account to create a recipe."
      erb :'users/new'
    end
  end

  get "/recipes/:id" do
    @user = current_user
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  get '/recipes/:id/favorite' do
    if logged_in?
      @recipe = Recipe.find_by(:id => params[:id])
      flash[:message] = "Must be a good one! You have saved \"#{@recipe.name}\" before."
      if !current_user.favorites.include?(@recipe)
        current_user.favorites << @recipe
        flash[:message] = "You have saved \"#{@recipe.name}\" as a favorite!"
      end
      redirect to "#{params[:location]}"
    else
      flash[:message] = "You do not have to be logged in to save favorites."
      erb :'recipes/error'
    end
  end

  get '/recipes/:id/spinoff' do
  
    if logged_in?
      @recipe = Recipe.find(params[:id])
      erb :"recipes/spinoff"
    else
      flash[:message] = "You have to have an account to spinoff a recipe."
      erb :'users/new'
    end
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


