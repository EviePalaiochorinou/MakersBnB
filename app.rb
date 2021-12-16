require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup.rb'

require './lib/user.rb'
require './lib/space.rb'


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
    @spaces = Space.all
    erb :"/space/spaces"
  end

  get "/spaces/new" do
    erb :"/space/new"
  end
  
  post '/spaces' do
    @space = Space.create(name: params[:name], description: params[:description], price_per_night: params[:price_per_night], available_from: params[:available_from], available_to: params[:available_to])
    #this will be connected to the space model
    redirect '/spaces'
  end

  get '/spaces/1' do # shows calendar
    session[:space_id] = @space.id

    erb :"/space/1"
  end

  post '/sessions/destroy' do
		session.clear
		redirect('/')
	end

  run! if app_file == $0
end

