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
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self 
    end

    def self.find_or_create_by_name(name)
       
        if self.all.find {|artist| artist.name == name}
           self.all.find {|artist| artist.name == name}
        else 
           self.new(name) 
        end
    end

    def print_songs
        list = Song.all.select {|songs| songs.artist == self }
        puts list.collect {|song| song.name}
    end
end