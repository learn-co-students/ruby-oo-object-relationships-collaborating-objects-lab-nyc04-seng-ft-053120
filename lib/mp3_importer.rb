class MP3Importer
    attr_accessor :path, :files
    def initialize (music_path)
        @path = music_path
    end
    def files
        file_array = Dir.children(@path)
    end
    def import
        files.each do |song_file|
            Song.new_by_filename(song_file)
        end   
    end
end