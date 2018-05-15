
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
      erb :new
  end

  post '/posts' do
      @post = Post.create('name' => params[:name], 'content' => params[:content])
      @post.save
      @posts = Post.all
      erb :posts
  end

  get '/posts' do
      @posts = Post.all
      erb :posts
  end

  get '/' do
       @posts = Post.all
      erb :index
  end

  get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :show
  end

  get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :edit
  end

  patch '/posts/:id/edit' do
      @post = Post.find(params[:id])
      @post.update('name' => params[:name], 'content' => params[:content])
      erb :show
  end

  get '/posts/:id/delete' do
      erb :show
  end

  delete '/posts/:id/delete' do
      @post = Post.find(params[:id])
      @post.delete
      erb :show
  end

end
