class MP3Importer
    attr_accessor :path, :mp3files
    def initialize(path)
        @path = path
        @mp3files = []
    end

    def files
        Dir.entries(@path).each do |file|
            if file.include?(".mp3")
                @mp3files << file
            end
        end
        @mp3files
    end

    def import
        files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end