class Genre

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
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    artists = songs.collect {|song| song.artist}
    artists.uniq
  end 

end
