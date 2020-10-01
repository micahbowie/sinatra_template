class NoteController < ApplicationController

  get '/notes' do
    if !logged_in?
      redirect "/login"
    else
    erb :all_notes
   end
  end

  get '/notes/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :new_note
    end
  end

  post '/savenote' do
    @note = Note.new
    @note.title = params[:title]
    @note.content = params[:content]
    @note.user_id = User.find_by(:username => session[:username]).id

    if @note.save
      redirect "/notes/#{@note.id}"
    else
      "note can not be saved"
    end
  end

get '/notes/:id/edit' do
  # @user = User.find_by(:username => session[:username])
  # @all_notes = @user.notes
  # @note = @all_notes.where(:id => params[:id])
   if !logged_in?
     redirect "/login"
   else
     erb :edit_note
   end
end

patch "/notes/:id" do
  # binding.pry
     @note = Note.find_by(id: params[:id])
     @note.title = params[:title]
     @note.content = params[:content]
     @note.user_id = User.find_by(:username => session[:username]).id
     @note.save
     redirect to "/notes/#{ params[:id] }"
end

get '/notes/:id' do
  # @user = User.find_by(:username => session[:username])
  # @all_notes = @user.notes
  # @note = all_notes.where(:id => params[:id]) if @user.id == @note.user_id
   if !logged_in?
     redirect "/login"
   else
     erb :note
   end
end


end
