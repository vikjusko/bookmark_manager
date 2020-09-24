require "pg"

p "Setting up test database..."

def setup_test_database
	con = PG.connect :dbname => "bookmark_manager_test"
	con.exec("TRUNCATE bookmarks;") 
	Bookmark.all
end 