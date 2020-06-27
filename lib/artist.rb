require "pry"
require_relative "./song.rb"
class Artist
    attr_accessor :name
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end
    # lsits songs that have this istance as its artist
    def songs   
       
        Song.all.select do |song_instance| 
            song_instance.artist == self
        end 
        
    end

    def add_song(song)
        # instance method is tied to its instance when its created
       song.artist = self
    #   binding.pry
    end
    

    def self.find_or_create_by_name(name)
        # class method is tied to usings on class
        # self here is currently being accessed in the class
        finder = self.all.find do |artist_instance|
           artist_instance.name == name
        end

        if !finder
           return Artist.new(name)
        else
            finder
        end
        
    end

    def print_songs
       self.songs.each do |song_instance|
           puts song_instance.name
       end
       
    end
  

end
s1 = Song.new("billie jean")
s2 = Song.new ("Thriller")
a1 = Artist.new("Michael Jackson")
a1.add_song(s1)
a1.add_song(s2)
#  binding.pry