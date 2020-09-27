class SessionController < ApplicationController

  get '/login' do
   erb :index
  end


  post '/session' do
    login(params[:username], params[:password])
    redirect '/notes'
  end

  get '/logout' do
   logout!
   redirect "/login"
  end


end
