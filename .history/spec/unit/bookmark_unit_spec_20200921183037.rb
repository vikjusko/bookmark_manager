require 'bookmark'
require 'pg'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            setup_test_database
           # con = PG.connect :dbname => "bookmark_manager_test"
           # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
           # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
           # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
             Bookmark.all
            expect(Bookmark.all).to eq ["http://www.askjeeves.com", "http://www.makersacademy.com", "http://www.destroyallsoftware.com"]
        end
    end
end