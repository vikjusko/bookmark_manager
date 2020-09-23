require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

    get '/' do 
        "Bookmark Manager"
    end

    get '/bookmarks' do
        erb :bookmark_list
    end

    get '/bookmarks/new' do
        erb :bookmarks_new
    end 

    post '/bookmarks' do
      url = params[:url]
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec("INSERT INTO bookmarks ('url') VALUES('#{url}')")
      redirect '/bookmarks'
    end 
        

    run if app_file ==$0

end