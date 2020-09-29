class NoteController < ApplicationController

  get '/notes' do
    erb :notes
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
      redirect "/notes"
    else
      "note can not be saved"
    end
  end

get '/notes/:id/edit' do
   if !logged_in?
     redirect "/login"
   else
     "edit note"
   end
end

end
