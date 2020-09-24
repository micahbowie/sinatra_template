require 'sinatra'

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "jot_it_down"
end

#application_controller
helpers do

  def logged_in?
    !!session[:username]
  end

  def login(username)
    session[:username] = username
  end

  def logout!
    session.clear
  end
end

#sessioncontroller
get '/' do
   erb :index
end


post '/sessions' do
    login(params[:email])
    redirect '/notes'
end

get '/logout' do
   logout!
   redirect "/"
end

#notescontroller
get '/notes' do
   "all notes #{session[:username]}"
end

get '/notes/new' do
   if !logged_in?
     redirect "/"
   else
     "Start a new post"
   end
end

get '/notes/:id/edit' do
   if !logged_in?
     redirect "/"
   else
     "edit note"
   end
end
