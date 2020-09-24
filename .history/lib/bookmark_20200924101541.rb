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
        con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    end 
end