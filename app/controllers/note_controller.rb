class NoteController < ApplicationController

  get '/notes' do
    user = User.find_by(:username => session[:username]).id
    notes = Note.find_by(:user_id => user)
    "all notes #{notes.title}"
  end

  get '/notes/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :new_note
    end
  end

  post '/savepost' do
      note = params[:note]
  end

get '/notes/:id/edit' do
   if !logged_in?
     redirect "/login"
   else
     "edit note"
   end
end

end
