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
