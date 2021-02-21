# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup'
# Bundler.require(:default, ENV['SINATRA_ENV'])

# set :database_file, "./database.yml"

# require_all 'app'


ENV['RACK_ENV'] ||= "development"
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])
configure :development do
    set :database, 'sqlite3:db/development.sqlite'
end
configure :production do
    set :database, ENV['DATABASE_URL']
end
require_all 'app'