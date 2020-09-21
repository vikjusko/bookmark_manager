require 'bookmark'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            bookmark = Bookmark.all
            expect(bookmark.all).to eq ["www.google.com", "www.twitter.com", "www.youtube.com"]
        end
    end
end