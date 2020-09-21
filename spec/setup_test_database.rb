require "pg"

p "Setting up test database..."

def setup_test_database
	con = PG.connect :dbname => "bookmark_manager_test"
	con.exec("TRUNCATE bookmarks;")
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
	Bookmark.all
end 