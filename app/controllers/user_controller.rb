class UserController < ApplicationController

  get '/' do
    erb :index
  end

  post '/users' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      redirect "/"
    end
  end

end
