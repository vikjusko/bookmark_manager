require 'pg'
class Bookmark

    attr_accessor :id, :title, :url

    def initialize(id:, url:, title:)
        @id = id
        @title = title
        @url = url
    end 

    def self.all
        result = set_up.exec("SELECT * FROM bookmarks")
        result.map do |bookmark|
         Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
        end
    end

    def self.create(url:, title:)
        result = set_up.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
        Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
    end 
   
    def self.delete(id:)
        set_up.exec("DELETE FROM bookmarks WHERE id = #{id}")
    end

    def self.set_up
        if ENV['ENVIRONMENT'] == 'test'
            con = PG.connect(dbname: 'bookmark_manager_test')
        else
            con = PG.connect(dbname: 'bookmark_manager')
        end
    end

    def self.edit(id:, url:, title:)
        result = set_up.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id=#{id};")
        result = Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
    end
end