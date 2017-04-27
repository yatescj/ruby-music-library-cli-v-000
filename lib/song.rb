class Song

  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    @genre = genre
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

  def artist=(artist)
    @artist = artist
    artist.add_song(name)
  end
end
