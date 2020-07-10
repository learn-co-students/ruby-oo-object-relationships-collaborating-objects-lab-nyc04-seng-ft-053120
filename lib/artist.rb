require 'pry'
class Artist 
attr_accessor :name

@@all  = []

def initialize(name)
@name = name 
@@all << self
end

def self.all
    @@all
end

def songs
   Song.all.select{|song| song.artist == self}

end

def add_song(song)
    song.artist = self
end

def self.find_or_create_by_name(name)
    if x = Artist.all.find{|artist| artist.name == name} 
     x   
    else 
    Artist.new(name)
    end
end

def print_songs 
    self.songs.map{|song| puts song.name}
end


end