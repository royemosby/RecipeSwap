class UserController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/error' do
    erb :'users/error'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  post '/users' do
    if !!params[:username] && !!params[:password]
      user = User.create(:username => params[:username], :password => params[password], :email => params[:email])
      redirect to "/users/#{user.id}"
    else
      redirect to '/users/error' #TODO: create error route
    end
  end


end
