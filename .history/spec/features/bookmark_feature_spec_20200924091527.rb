require 'pg' 

feature 'Viewing Bookmark homepage' do
    scenario 'Index page should show bookmark manager' do
        visit('/')
        expect(page).to have_content "Bookmark Manager"
    end
end


feature 'Viewing Bookmarks page' do
        scenario 'Bookmarks page should have a bookmark' do
        Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
        Bookmark.create(url: "http://www.askjeeves.com", title: 'Ask Jeeves')
        Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
        visit('/bookmarks')
        expect(page).to have_link "http://www.askjeeves.com"
        expect(page).to have_link "http://www.makersacademy.com"
        expect(page).to have_link "http://www.destroyallsoftware.com"
    end
end 

feature "adding a new bookmark" do 
    scenario 'A user can add a new bookmark to a Bookmark manager' do
        visit ('/bookmarks/new')
        fill_in :url, with: 'http://www.google.com'
        fill_in :title, with: "Google"
        click_button("Submit")
        expect(page).to have_link('Google', href: 'http://www.google.com')
    end 
end 