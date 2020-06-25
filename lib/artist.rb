require "pry"

class Artist

    attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select { |song_instance|
            song_instance.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        #self.all.find(name) ? self.all.find(name) : Artist.new(name)
        #binding.pry
        self.all.find { |artist| artist.name == name} ? self.all.find { |artist| artist.name == name} : Artist.new(name)
    end

    def print_songs
        Song.all.select { |song_instance|
        if song_instance.artist == self
            puts song_instance.name
        end }
    end

end
