require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

    enable :sessions, :method_override

    get '/' do 
        "Bookmark Manager"
    end

    get '/bookmarks' do
        @bookmarks_list = Bookmark.all
        erb :bookmark_list
    end

    get '/bookmarks/new' do
        erb :bookmarks_new
    end

    delete '/bookmarks/:title' do
        p params
        con = PG.connect(dbname: "bookmark_manager_test")
        con.exec("DELETE FROM bookmarks WHERE title = #{title};")
        redirect '/bookmarks'
    end

    post '/bookmarks' do
      Bookmark.create(url: params[:url], title: params[:title])
      redirect '/bookmarks'
    end 
        

    run if app_file ==$0

end