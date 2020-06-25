require "pry"
require_relative "artist.rb"

class Song

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename) # filename:  "artist_name - song_title" w/o extention
        (artistname, name) = filename.split(" - ") # separate artist name and song title
        song = Song.new(name)
        song.artist = Artist.find_or_create_by_name(artistname)
        song
    end

    def artist=(artist)
        @artist = artist
    end

    def artist
        @artist
    end

    def artist_name=(artistname)
        self.artist = Artist.find_or_create_by_name(artistname)
    end
end