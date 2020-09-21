require "pg"

p "Setting up test database..."

connection = PG.connect(dbname: "bookmark_manager_test")

# Clear the bookmarks table
connection.exec("TRUNCATE bookmarks;")

def setup_test_database
	con = PG.connect :dbname => "bookmark_manager_test"
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
	con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
end 