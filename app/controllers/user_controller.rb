class UserController < ApplicationController

get '/register' do
    erb :register
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      erb :'users/new.html'
    end
  end

end
