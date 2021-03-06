class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/statuses'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/statuses'
    end
  end

  get '/signup' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/statuses'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup?error=invalid user signup information'
    elsif(User.exists?(username: params[:username]))
      redirect to '/signup?error=username already taken'
    else

      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/statuses'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/statuses'
    end
  end

  post '/login' do

    user = User.find_by(:username => params[:username])


    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/statuses"
    else
      redirect to '/login?error=invalid user login information'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end