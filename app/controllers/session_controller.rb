class SessionController < ApplicationController

  get '/' do
   erb :index
  end


  post '/sessions' do
    login(params[:username])
    redirect '/notes'
  end

  get '/logout' do
   logout!
   redirect "/"
  end


end
