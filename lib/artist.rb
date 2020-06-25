class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist=(self)
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find do |artist|
            artist.name == name
        end
    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self
                puts "#{song.name}"
            end
        end
    end
end