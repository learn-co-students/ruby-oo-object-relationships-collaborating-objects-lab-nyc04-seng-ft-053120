require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path=path
    end
    def files
        mp3files=Dir.glob("#{self.path}/*.mp3")
        mp3files.map {|file| file.split("/")[4]}
    end
    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end





end
