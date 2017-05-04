class MusicLibraryController

  extend Concerns::Findable
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    loop do
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        puts "Pick a number"
        list_songs
        input_number = gets.chomp
        song_choice = Song.all.sort_by{|s| s.artist.name }[input_number.to_i - 1]
        puts "Playing #{song_choice.artist.name} - #{song_choice.name} - #{song_choice.genre.name}"

      when "list artist's songs"
        puts "Which artist?"
        list_artists
        input_artist = gets.chomp
        find_by_name(input_artist).songs.each do |artist|
          puts "#{artist.name} - #{artist.song.name} - #{artist.genre}"
        end
      when "list a genre's "
        puts "Which genre?"
        list_genres
        input_genre = gets.chomp
        find_by_name(input_genre).songs.each do |genre|
          puts "#{genre.artist.name} - #{genre.song.name} - #{genre.name}"
        end 

      when "exit"
        break
      end
    end
  end

  def list_songs
    count = 0
    Song.all.sort_by{|s| s.artist.name }.each do |song|
      puts "#{count += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

end
