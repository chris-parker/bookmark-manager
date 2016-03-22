require 'sinatra/base'
require './lib/link'

class Bookmark < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/form'
  end

  post '/links' do
    Link.create title: params[:title], url: params[:url]
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
