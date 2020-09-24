require 'pg'
class Bookmark

    attr_accessor :id, :title, :url

    def initialize(id:, url:, title:)
        @id = id
        @title = title
        @url = url
    end 

    def self.all
        if ENV["ENVIRONMENT"] == "test"
            con = PG.connect(dbname: "bookmark_manager_test")
         else
            con = PG.connect(dbname: "bookmark_manager")
        end
        result = con.exec("SELECT * FROM bookmarks")
        result.map do |bookmark|
         Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
        end
    end

    def self.create(url:, title:)
        if ENV["ENVIRONMENT"] == 'test'
            con = PG.connect :dbname => 'bookmark_manager_test'
        else 
            con = PG.connect :dbname => 'bookmark_manager'
        end 
        result = con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
        Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
    end 

    class Bookmark
    def self.delete(title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE title = #{title}")
  end
end