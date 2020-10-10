require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "jot_it_down"
    register Sinatra::Flash
  end

  helpers do
    def logged_in?
      !!session[:username]
    end

    def logout!
      session.clear
    end

    def current_user
      User.find_by(:username => session[:username])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

end
end
