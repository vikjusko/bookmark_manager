require 'sinatra/base'

class Bookmark < Sinatra::Base

    get '/' do 
        "Bookmark Manager"
    end

    get '/bookmarks' do
    
        erb :bookmark_list
    end


    run if app_file ==$0

end