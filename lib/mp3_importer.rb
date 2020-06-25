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

        self.files.collect{|file| file.split(" - ")}
        #Song.new_by_filename(some_filename)
    end
end