feature 'Viewing Bookmark homepage' do
    scenario 'Index page should show bookmark manager' do
        visit('/')
        expect(page).to have_content "Bookmark Manager"
    end
end


feature 'Viewing Bookmarks page' do
    scenario 'Bookmarks page should have a bookmark' do
        visit('/bookmarks')
        expect(page).to have_content "Google\nYahoo\nBing"
    end
end