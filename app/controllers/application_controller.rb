
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

  get '/posts/:id/edit' do
      erb :edit
  end

  patch '/posts/:id' do
      binding.pry
      @post = Post.find(params[:id])
      @post.update('name' => params[:name], 'content' => params[:content])
      erb :posts
 #    params{"name"=>"name1",
 # "content"=>"content1",
 # "_method"=>"patch",
 # "submit"=>"submit",
 # "id"=>":id"}?????
  end


end
