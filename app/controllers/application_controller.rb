require 'securerandom'
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    #TODO: reset secret with an ENV variable
    #see Using Sessions in http://sinatrarb.com/intro.html
  end

  get "/" do
    if logged_in?
      @user = current_user
    end
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end
  end

end