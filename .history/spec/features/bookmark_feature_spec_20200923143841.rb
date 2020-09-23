require 'pg' 

feature 'Viewing Bookmark homepage' do
    scenario 'Index page should show bookmark manager' do
        visit('/')
        expect(page).to have_content "Bookmark Manager"
    end
end


feature 'Viewing Bookmarks page' do
        scenario 'Bookmarks page should have a bookmark' do
        visit('/bookmarks')
        expect(page).to have_content "http://www.askjeeves.com"
        expect(page).to have_content "http://www.makersacademy.com"
        expect(page).to have_content "http://www.destroyallsoftware.com"
    end
end 

feature "adding a new bookmark" do 
    scenario 'A user can add a new bookmark to a Bookmark manager' do
        visit ('/bookmarks/new')
        fill_in :url, with: 'http://www.google.com')
        click_button("Submit")
        expect(page).to have_content 'http://www.google.com'
    end 
end 