class NoteController < ApplicationController

  get '/notes' do
    @current_user_notes = current_user.notes.pluck(:id, :title, :content) 
    redirect_if_not_logged_in
    erb :"notes/all_notes"
  end

  get '/notes/new' do
    redirect_if_not_logged_in
      erb :"notes/new_note"
  end

  post '/savenote' do
    @note = Note.new
    @note.title = params[:title]
    @note.content = params[:content]
    @note.user_id = User.find_by(:username => session[:username]).id
    # @user.create or build here

    if @note.save
      redirect "/notes/#{@note.id}"
    else
      erb :error
    end
  end

  get '/notes/:id/edit' do
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
    authenticate_user
    erb :"notes/edit_note"
  end

  get '/notes/:id' do
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
    authenticate_user
    erb :"notes/note"
  end

  patch "/notes/:id" do
     authenticate_user
     @note = Note.find_by(id: params[:id])
     @note.title = params[:title]
     @note.content = params[:content]
     @note.save
     redirect to "/notes/#{ params[:id] }"
  end

  delete "/notes/:id" do
    @note =  Note.find(params[:id])
    authenticate_user
    @note.destroy
    redirect "/notes"
  end
end
