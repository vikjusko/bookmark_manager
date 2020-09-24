require 'bookmark'
require 'pg'

describe Bookmark do
    
    describe 'Open bookmark list' do
        it 'Opening bookmark page should list out the bookmarks' do
            expect(Bookmark.all).to eq ["http://www.askjeeves.com", "http://www.makersacademy.com", "http://www.destroyallsoftware.com"]
        end
    end

    describe  ".create a bookmark" do
    scenario "user can create a new bookmark" do    
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'Googlr')
    click_button('Submit')
    expect(page).to have_link('Googlr', href: 'http://www.google.com')
  end
end
end