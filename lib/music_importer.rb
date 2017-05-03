require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*mp3")
    files.map {|file| file.gsub("#{path}/", '')}
  end 

end
