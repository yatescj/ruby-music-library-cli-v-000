require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def add_song(song)
    if !@songs.detect {|s| s == song}
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end


  # def add_song_by_name(name)
  #   song = Song.new(name)
  #   @songs << song
  #   song.artist = self
  # end

end
