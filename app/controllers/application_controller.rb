require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "jot_it_down"
  end

  helpers do

    def logged_in?
      !!session[:username]
    end

    def login(username, password)

      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end

    end

    def logout!
      session.clear
    end
  end

end
