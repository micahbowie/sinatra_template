require 'rack-flash'

class SessionController < ApplicationController
  use Rack::Flash

  get '/login' do
   erb :index
  end


  post '/session' do
    login(params[:username], params[:password])
    # flash[:success] = "Welcome back #{params[:username]}!"
    # sleep 2.0
    redirect "/notes"


  end

  get '/logout' do
   logout!
   redirect "/login"
  end

end
