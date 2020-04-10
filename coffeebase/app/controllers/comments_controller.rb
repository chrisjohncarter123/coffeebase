class CommentsController < ApplicationController
  get "/comments" do
    redirect_if_not_logged_in
    @comments = Comment.all
    erb :'comments/index'
  end

  get "/comments/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'comments/new'
  end

  get "/comments/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @comment = Comment.find(params[:id])
    erb :'comments/edit'
  end

  post "/comments/:id" do
    redirect_if_not_logged_in
    @comment = Comment.find(params[:id])
    unless Comment.valid_params?(params)
      redirect "/comments/#{@comment.id}/edit?error=invalid comment"
    end
    @comment.update(params.select{|k|k=="content"|| k=="status_id"})
    redirect "/comments/#{@comment.id}"
  end

  get "/comments/:id" do
    redirect_if_not_logged_in
    @comment = Comment.find(params[:id])
    erb :'comments/show'
  end

  post "/comments" do
    redirect_if_not_logged_in
    unless Comment.valid_params?(params)
      redirect "/comments/new?error=invalid comment"
    end
    Comment.create(params)
    redirect "/comments"
  end
end