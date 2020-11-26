require 'pry'
class MP3Importer
    attr_accessor :path 
    def initialize(path)
        @path = path
    end
    def files 
        files = Dir.children(self.path)
    end
    def import 
        self.files.each{|index|Song.new_by_filename(index)}
        
    end
end

# mp3=self.files.collect{|file| file.split(" - ")}
#         mp3.each{|index| index.pop}
#         mp3.each{|index| 
#             Artist.new(index[0])
#             }