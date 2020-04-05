
require_relative '../../config/environment'

class PostsController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"posts/show"
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.description = params[:description]
    post.review = params[:review]
    post.save

    redirect "/posts/#{params[:id]}"
  end


  post '/posts' do

    user_id = session[:user_id]
    description = params[:description]
    review = params[:review]

    Post.create(:user_id => user_id, :description => description, :review => review)

    redirect "/users/home"


  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end


  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy

    redirect "/users/home"
  end

end
