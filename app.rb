require 'sinatra/base'
require './lib/bookmarks.rb'

# Class comment
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'index'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/action' do
    if params[:submit] == 'add_bookmark'
      redirect '/bookmarks/add'
    end
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  get '/bookmarks/store'do
    Bookmark.add(params[:title],params[:url])
    redirect '/bookmarks'
  end
  run! if app_file == $PROGRAM_NAME
end
