
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
    post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    article = Post.find(params[:id])
    article.title = params[:title]
    article.content = params[:content]
    article.save

    redirect "/posts/#{params[:id]}"
  end


  post '/posts' do
    "hello"
    user_id = session[:user_id]
    user_content = params[:content]

    Posts.create(:user_id => user_id, :content => user_content)

    redirect "/users/home"


  end

  get '/posts/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end




  delete '/posts/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/posts"
  end

end
