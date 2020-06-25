# frozen_string_literal: true

require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries(@path).select {|f| !File.directory? f}
    all_mp3_files = all_files.select do |file|
      file.end_with?(".mp3")
    end
  end


  def import
    files.each {|filename| Song.new_by_filename(filename) }
  end
end