class UserController < ApplicationController

  get '/login' do
    erb :'login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    #binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      erb :'users/failure'
    end
  end
  
  get '/users' do
    @users = User.all
    erb :'users/index'
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
    
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch '/users' do
    #TODO: validate against session and params[:old_password]
    #TODO: update user. Include new_password IF NOT empty
  end

  post '/users' do
    if !!params[:username] && !!params[:password]
      user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
      redirect to "/users/#{user.id}"
    else
      redirect to '/users/error'
    end
  end

  #TODO: add session helpers

end
