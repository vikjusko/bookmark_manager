require 'bookmark'
require 'pg'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            expect(Bookmark.all).to eq ["http://www.askjeeves.com", "http://www.makersacademy.com", "http://www.destroyallsoftware.com"]
        end
    end

    describe  ".create a bookmark" do
        it "creates a bookmark" do 
            bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
            expect(bookmark.url).to eq('http://www.google.com')
            expect(bookmark.title).to eq('Google')
            expect(Bookmark.all).to include('http://www.google.com')
        end 
    end 
end