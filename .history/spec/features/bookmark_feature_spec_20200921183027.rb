require 'pg' 

feature 'Viewing Bookmark homepage' do
    scenario 'Index page should show bookmark manager' do
        visit('/')
        expect(page).to have_content "Bookmark Manager"
    end
end


feature 'Viewing Bookmarks page' do
    scenario 'Bookmarks page should have a bookmark' do
        setup_test_database
        #con = PG.connect :dbname => "bookmark_manager_test"
        #con.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
        #con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
        #con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
        visit('/bookmarks')
        expect(page).to have_content "http://www.askjeeves.com"
        expect(page).to have_content "http://www.makersacademy.com"
        expect(page).to have_content "http://www.destroyallsoftware.com"
    end
end