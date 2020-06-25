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

    def self.new_by_filename(file_path)
        mp3 = file_path.split(' - ')
        song = Song.new(mp3[1])
        song.artist = Artist.new(mp3[0])
        song 
    end

    def artist_name=(name)
        if Artist.all.find {|artist| artist.name == name}
        self.artist = Artist.all.find {|artist| artist.name == name}
        else 
            self.artist = Artist.new(name) 
        end
    end
end