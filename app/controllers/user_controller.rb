require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

  get '/login' do
    erb :'login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "You are now logged in as #{user.username}."
      redirect to "/users/#{user.id}"
    else
      erb :'users/failure'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
  
  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/account' do
    if logged_in?
      @user = current_user
      erb :'users/account'
    else
      flash[:message] = "You must be logged on to view this page."
      redirect to '/users/error'
    end
  end
  
  get '/users/error' do
    erb :'users/error'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/users/:id/edit' do
    if current_user == User.find(params[:id])
      @user = current_user
      erb :'users/edit'
    else
      flash[:message] = "You are not allowed to edit another user's account info!"
      erb :'users/error'
    end
  end

  get '/users/:id/confirm-delete' do
    if current_user == User.find(params[:id])
      current_user.favorites.clear
      current_user.recipes.each do |recipe|
        if recipe.spinoffs.empty?
          recipe.delete
        else
          assign_recipe_to_system(recipe) #in app controller
        end
      end
      current_user.delete
      session.clear
      flash[:message] = "Your account has been deleted. Please contact <a href=\"mailto=admin@recipeswap.com\">RecipeSwap</a> in case you need further information"
      redirect to '/'
    else
      flash[:message] = "You are not allowed to modify another user's account info!"
      erb :'users/error'
    end
  end

  get '/users/:id/delete' do
    if current_user == User.find(params[:id])
      @user = current_user
      erb :'users/delete'
    else
      flash[:message] = "You are not allowed to modify another user's account info!"
      erb :'users/error'
    end
  end

  patch '/users' do
    @user = current_user.authenticate(params[:old_password])
    if !!@user
      @user.update(:username => params[:username], :email => params[:email])
      flash[:message] = "Username/email changes applied."
      if !!params[:new_password] && params[:new_password].length > 0
        @user.update(:password => params[:new_password])
        flash[:message] << " Password has been updated."
      end
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "Changes were not saved. You entered the incorrect password."
      redirect to '/users/error'
    end
    #TODO: validate against session and params[:old_password]
    #TODO: update user. Include new_password IF NOT empty
  end

  post '/users' do
    if !!User.find_by(:username => params[:username])
      flash[:message] = "Username <em>#{params[:username]}</em> already exists. Please choose another..."
      redirect to '/users/error'      
    end
    if !!params[:username] && !!params[:password]
      user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
      redirect to "/users/#{user.id}"
    else
      flash[:message] = "You are missing a username or password. Please try registering again"
      redirect to '/users/error'
    end
  end

  #TODO: add session helpers

end
