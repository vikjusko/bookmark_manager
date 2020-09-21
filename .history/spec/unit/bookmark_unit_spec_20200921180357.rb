require 'bookmark'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            con = PG.connect :dbname => "bookmark_manager_test"
            con.exec("INSERT INTO bookmarks (url) VALUES('http://askjeeves.com');")
            con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
            con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
            Bookmark.all
            expect(Bookmark.all).to eq ["http://askjeeves.com", "http://www.makersacademy.com", "http://www.destroyallsoftware.com"]
        end
    end
end