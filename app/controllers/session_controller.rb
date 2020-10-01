require 'rack-flash'
class SessionController < ApplicationController
  use Rack::Flash

  get '/login' do
   erb :login
  end


  post '/session' do
    login(params[:username], params[:password])
    # flash[:success] = "Welcome back #{params[:username]}!"
    redirect "/notes"
  end

  get '/logout' do
    logout!
    redirect "/login"
  end

end
