require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "coffee-masters"
  end


  get '/' do
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=Please login."
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def current_user_has_statuses?
      if logged_in?
        if Status.exists?(user_id: current_user.id)
          true
        end
      end
      false
    end

  end

end