
require_relative '../../config/environment'


class StatusesController < ApplicationController

  get "/statuses" do
    redirect_if_not_logged_in
    @statuses = Status.all
    erb :'statuses/index'
  end

  get "/statuses/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'statuses/new'
  end

  get "/statuses/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @status = Status.find(params[:id])
    erb :'statuses/edit'
  end

  delete "/statuses/:id/delete" do
    redirect_if_not_logged_in
    @status = Status.find(params[:id])
    @status.destroy
    redirect "/statuses"
  end

  post "/statuses/:id" do
    redirect_if_not_logged_in
    @status = Status.find(params[:id])
    unless Status.valid_params?(params)
      redirect "/statuses/#{@status.id}/edit?error=invalid status"
    end
    @status.update(params.select{|k|k=="title" || k=="content"})
    redirect "/statuses/#{@status.id}"
  end

  get "/statuses/:id" do
    redirect_if_not_logged_in
    @status = Status.find(params[:id])
    erb :'statuses/show'
  end

  post "/statuses" do
    redirect_if_not_logged_in

    unless Status.valid_params?(params)
      redirect "/statuses/new?error=invalid status"
    end
    Status.create(params)
    redirect "/statuses"
  end
end