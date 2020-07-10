require 'pry'
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

def artist_name=(name)
 x = Artist.find_or_create_by_name(name)
    x.add_song(self)
end

def self.new_by_filename(file)
    x = file.split(" - ")
 song = Song.new(x[1])
 Artist.new(x[0])
 song.artist = x[0]
song
end

end