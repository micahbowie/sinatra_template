class SessionController < ApplicationController

  get '/' do
   erb :index
  end


  post '/session' do
    login(params[:username], params[:password])
    redirect '/notes'
  end

  get '/logout' do
   logout!
   redirect "/"
  end


end
