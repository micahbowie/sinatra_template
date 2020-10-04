class SessionController < ApplicationController

  get '/login' do
   erb :login
  end


  post '/session' do
    login(params[:username], params[:password])
    flash[:success] = "Welcome back #{params[:username]}!"
    redirect "/notes"
  end

  get '/logout' do
    logout!
    # flash[:logout] = "You have now been logged out!"
    redirect "/login"
  end

end
