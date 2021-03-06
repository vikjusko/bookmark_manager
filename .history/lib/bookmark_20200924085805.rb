require 'pg'
class Bookmark
    def self.all 
        if ENV['ENVIRONMENT'] == 'test'
            con = PG.connect :dbname => 'bookmark_manager_test'
        else
            con = PG.connect :dbname => 'bookmark_manager'
        end 
        result = con.exec ( "SELECT * FROM bookmarks" )
        result.map do |row|
            p row['url']
        end
    end

    def self.create(url:, title:)
        if ENV["ENVIRONMENT"] == 'test'
            con = PG.connect :dbname => 'bookmark_manager_test'
        else 
            con = PG.connect :dbname => 'bookmark_manager'
        end 
        con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title";)
    end 
end