require 'bookmark'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            Bookmark.all
            expect(bookmark.all).to eq ("http://askjeeves.comhttp://www.makersacademy.comhttp://www.destroyallsoftware.com")
        end
    end
end