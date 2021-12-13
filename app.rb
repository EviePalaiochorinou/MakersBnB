require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup.rb'

require './lib/user.rb'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

#   post '/users' do
#   end

  run! if app_file == $0
end

# We need a database which will be called makersbnb
# Inside that makersbnb DB - we need a users table
# - id - PRIMARY SERIAL KEY
# - email - VARCHAR(100)
# - password - VARCHAR(60)
# - username - VARCHAR (60)