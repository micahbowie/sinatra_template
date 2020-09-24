class NoteController < ApplicationController

get '/notes' do
   "all notes #{session[:username]}"
end

get '/notes/new' do
   if !logged_in?
     redirect "/"
   else
     "Start a new post"
   end
end

get '/notes/:id/edit' do
   if !logged_in?
     redirect "/"
   else
     "edit note"
   end
end

end
