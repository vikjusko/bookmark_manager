require "pg"

p "Setting up test database..."

def setup_test_database
	con = PG.connect :dbname => "bookmark_manager_test"
	con.exec("TRUNCATE bookmarks;") 
	Bookmark.all
end 

def persisted_data(id:)
  connection = PG.connect(dbname: "bookmark_manager_test")
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
