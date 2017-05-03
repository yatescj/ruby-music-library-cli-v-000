require 'pry'
class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename) # song = Song.new_from_filename('Thundercat - For Love I Come - dance.mp3')
    file_array = filename.gsub(".mp3", '').split(' - ')
    # name = file_array[1]
    song = self.find_or_create_by_name(file_array[1])
    song.artist = Artist.find_or_create_by_name(file_array[0])
    song.genre = Genre.find_or_create_by_name(file_array[2])
    song
  end

  def self.create_from_filename(filename)
    # file_array = filename.gsub(".mp3", '').split(' - ')
    # song = self.find_or_create_by_name(file_array[1])
    # song.artist = Artist.find_or_create_by_name(file_array[0])
    # song.genre = Genre.find_or_create_by_name(file_array[2])
    song = new_from_filename(filename)
    song.save
    song
  end


end
