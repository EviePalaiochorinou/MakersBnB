require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup.rb'

require './lib/user.rb'


class MakersBnB < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'signup/index'
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password], username: params[:username])
    
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/session' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user 
      session[:user_id] = user.id
      redirect "/spaces"
    end
  end

  get "/spaces" do
    @user = User.find(id: session[:user_id])
    erb :"/space/spaces"
  end

  get "/spaces/new" do
    erb :"/space/new"
  end
  
  post '/spaces' do
    #space = Space.create(id: params[:id], name: params[:name], description: params[:description], )
    #this will be connected to the space model
    redirect '/spaces'
  end

### IT IS PLURAL IN THE MOCK UP => spaces ! and starts at '/spaces/1'
  # get '/spaces' do        # => READ: see all listings
  #   erb :'spaces/index'   # => index page to display all spaces with button 'List A Space'
  # end

  # get '/spaces/new' do    # => READ: displays the 'List A Space' form
  #   erb :'spaces/new'
  # end

  # post '/spaces' do       # => CREATE: one Space
  #   # use logic from the Model to use the params
  #   redirect '/spaces'
  # end

  post '/sessions/destroy' do
		session.clear
		redirect('/')
	end

  run! if app_file == $0
end

