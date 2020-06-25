require "pry"

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_data_array = filename.split(" - ")
        new_song = Song.new(song_data_array[1])
        new_song.artist = Artist.new(song_data_array[0])
        
        new_song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end