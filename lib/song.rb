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

  def artist_name=(artist_name_str)
    artist_object = Artist.find_or_create_by_name(artist_name_str)
    artist_object.add_song(self)
  end

  def self.new_by_filename(filename)
    filename = filename.split(' - ')
    song_name_from_file = filename[1]
    artist_name_from_file = filename[0]

    new_song = Song.new(song_name_from_file)
    new_song.artist_name = artist_name_from_file
    new_song
  end

  
end