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
        p params 
        p "Form data subrmitted to your bookmarks page"
    end 
        

    run if app_file ==$0

end