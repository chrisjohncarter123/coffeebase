
require_relative '../../config/environment'

class CommentsController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  # patch '/posts/:id' do
  #   article = Post.find(params[:id])
  #   article.title = params[:title]
  #   article.content = params[:content]
  #   article.save
  #
  #   redirect "/posts/#{params[:id]}"
  # end

  post '/comments' do
    user_id = sessions[:id]
    comment_content = params[:content]

    Comment.create(:user_id => user_id, :content => comment_content)

    redirect "/users/home"

  end

  delete '/comments' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/users/home"
  end

end
