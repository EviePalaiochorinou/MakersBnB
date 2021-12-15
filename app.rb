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

  post '/sessions/destroy' do
		session.clear
		redirect('/')
	end

  run! if app_file == $0
end

