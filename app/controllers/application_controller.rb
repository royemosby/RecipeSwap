class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    @recipes = Recipe.order(:created_at => :desc).limit(10)
    if logged_in?
      @user = current_user
    end
    #binding.pry
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end

    def assign_recipe_to_system(recipe)
      recipe_swap = User.find_by(:username => "RecipeSwap") || User.create(:username => "RecipeSwap", :password => SecureRandom.alphanumeric) #Do not need pw. Can work directly in DB.
      recipe.user = recipe_swap
      recipe.save
    end
  end

  not_found do
  status 404
  erb :not_found
end

end