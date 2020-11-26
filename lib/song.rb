require "pry"
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @artist = artist
        self.class.all << self
        # binding.pry
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        zx =file_name.split(" - ")
        new_song = Song.new(zx[1])
        Artist.find_or_create_by_name(zx[0]).add_song(new_song)
        new_song
       
    end
    def artist_name= (artist_name)
        Artist.find_or_create_by_name(artist_name).add_song(self)
        
        
    end
end

