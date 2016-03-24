require 'sinatra/base'
require_relative 'models/data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:sign_in)
  end

  get '/home' do
    @links = Link.all
    erb(:home)
  end

  get '/add_link' do
    erb(:add_link)
  end

  get '/tags/:name' do
    tag =  Tag.all(name: params[:name])
    @links = tag.links
    erb(:home)
  end

  post '/new' do
    link = Link.create(title: params[:title], href: params[:href])
    Tag.create_tags(LinkTag,link, params[:tags])
    redirect to('/home')
  end

  get '/new_user' do
    erb(:new_user)
  end

  post '/new_user' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    user = User.create(username: username, email: email, password: password)
    session[:user_id] = user.id
    redirect to('/home')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
