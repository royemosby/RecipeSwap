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
      erb :'users/error'
    end
  end

  patch '/users' do
    #TODO: validate against session and params[:old_password]
    #TODO: update user. Include new_password IF NOT empty
  end

  post '/users' do
    if !!User.find_by(:username => params[:username])
      redirect to '/users/error'      
    end
    if !!params[:username] && !!params[:password]
      user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
      redirect to "/users/#{user.id}"
    else
      redirect to '/users/error'
    end
  end

  #TODO: add session helpers

end
