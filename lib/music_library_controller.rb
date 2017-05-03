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
        count = 0
        song_list = Song.all.sort
        # Song.all.each do |song|
        song_list.each do |song|
          puts "#{count += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "exit"
        break
      end
    end
    # loop do
    #   case input
    #   when "list songs"
    #     Songs.all
    #   end
  end

end
