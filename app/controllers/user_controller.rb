class UserController < ApplicationController
  # validates :username,      :presence => true, :uniqueness => true
  # validates :password_digest,      :presence => true

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
      erb :register
    end
  end

end
