class Artist
    attr_accessor :name
    @@all=[]
    def initialize (name)
        @name=name
        @songs=[]
        @@all<<self
    end
    def songs
        Song.all.select do |song|
            song.artist==self
        end
    end
    def add_song(song)
        song.artist=self
    end
    def self.all
        @@all
    end
    def self.find_or_create_by_name(artist_name)
        if self.find(artist_name)
            self.find(artist_name)
        else
            self.new(artist_name)
        end
    end
    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end
    
    def print_songs
       self.songs.map {|song| puts song.name}
    end



end