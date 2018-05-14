
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
      erb :index
  end

  get '/posts/new' do
      erb :new
  end

  post '/posts' do
      Post.create('name' => params[:name], 'content' => params[:content])
      @posts = Post.all
      erb :posts
  end

  get '/posts' do
      @posts = Post.all
      erb :posts
  end

  get '/show/:id' do
      binding.pry
      @post_found = Post.all.find(params[:id])
      erb :show
  end

end
