require 'bookmark'
require 'pg'

describe Bookmark do
    
   # describe 'Open bookmark list' do
    #    it 'Opening bookmark page should list out the bookmarks' do
       #     expect(Bookmark.all).to eq ["http://www.askjeeves.com", "http://www.makersacademy.com", "http://www.destroyallsoftware.com"]
    #    end
    #end

    describe  ".create a bookmark" do
        it "creates a bookmark" do 
            setup_test_database
            bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
            persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
            expect(bookmark).to be_a Bookmark
            expect(bookmark.id).to eq persisted_data.first['id']
            expect(bookmark.url).to eq('http://www.google.com')
            expect(bookmark.title).to eq('Google')
        end 
    end 

    describe ".all" do
      it "returns a list of bookmarks" do
      con = PG.connect(dbname: "bookmark_manager_test")
      bookmark = Bookmark.create(url: "http://www.askjeeves.com", title: "Ask Jeeves")
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Ask Jeeves"
      expect(bookmarks.first.url).to eq "http://www.askjeeves.com"
    end
    end
end