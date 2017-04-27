class Artist

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

  def self.create(name)
    self.new(name).save
  end

  def add_song(song)
    # song = Song.new(name)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  # def add_song_by_name(name)
  #   song = Song.new(name)
  #   @songs << song
  #   song.artist = self
  # end

end
