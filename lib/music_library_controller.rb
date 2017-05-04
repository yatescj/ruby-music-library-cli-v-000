class MusicLibraryController

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
        Song.all.each do |song|
          puts "#{song.artist.name}"
        end
      when "list genres"
        Song.all.each do |song|
          puts "#{song.genre.name}"
        end
      when "play song"
        puts "Pick a number"
        list_songs
        input_number = gets.chomp
        song_choice = Song.all.sort_by{|s| s.artist.name }[input_number.to_i - 1]
        puts "Playing #{song_choice.artist.name} - #{song_choice.name} - #{song_choice.genre.name}"

      when "list artist's songs"
        Artist.songs.each do |artist|
          puts "#{artist.name} - #{artist.song.name} - #{artist.song.genre}"
        end
      # when "list a genre's "
      when "exit"
        break

      end
    end
  end
    # loop do
    #   case input
    #   when "list songs"
    #     Songs.all
    #   end
  def list_songs
    count = 0
    # Song.all.sort
    Song.all.sort_by{|s| s.artist.name }.each do |song|
    # song_list.each do |song|
      puts "#{count += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
