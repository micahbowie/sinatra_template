class UserController < ApplicationController

get '/register' do
    erb :register
  end

  post '/users' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      redirect "/register"
    end
  end

end
