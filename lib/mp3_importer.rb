class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path 
  end

  def files
    @files = @files || Dir["#{self.path}/*.mp3"].map { |filename| normalize_filename(filename) }
    @files
  end

  def import
    self.files.each { |file| Song.new_by_filename(file) }
  end

  private

  def normalize_filename(filename)
    filename.gsub("#{self.path}/", "")
  end
end