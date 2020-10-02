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

    def authenticate_user?
      @current_user = User.find_by(:username => session[:username]).id
      @author_of_note = Note.find(params[:id]).user_id
      if @current_user == @author_of_note
        true
      else
        false
      end
    end

    get '/notes/:id' do
      if authenticate_user? == true
        if !logged_in?
          redirect "/login"
        else
          erb :"notes/note"
        end
      else
        erb :error
      end
    end

    patch "/notes/:id" do
       @note = Note.find_by(id: params[:id])
       @note.title = params[:title]
       @note.content = params[:content]
       @note.user_id = User.find_by(:username => session[:username]).id
       @note.save
       redirect to "/notes/#{ params[:id] }"
    end

end
