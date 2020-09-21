
class Bookmark

    def initialize
        @bookmarks = [
            "www.google.com",
             "www.twitter.com",
              "www.youtube.com"]
    end

    def all 
        @bookmarks.each do |bookmark|
            bookmark
        end
    end
end