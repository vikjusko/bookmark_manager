require 'pg'

    


class Bookmark

   

    def self.all 
        con = PG.connect :dbname => 'bookmark_manager'
        result = con.exec ( "SELECT * FROM bookmarks" )
            result.map do |row|
                p row['url']
            end
    end

=begin @bookmarks.each do |bookmark|
            bookmark
=end
    

end