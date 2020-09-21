require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    import = MusicImporter.new(path)
    import.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets until input == "exit"
  end
  
  def list_songs
    songs = Song.all.sort_by(&:name)
    songs.each_with_index {|song,i|puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    artists = Artist.all.sort_by(&:name)
    artists.each_with_index {|artist,i|puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    genres = Genre.all.sort_by(&:name)
    genres.each_with_index {|genre,i|puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    songs = gets.songs.sort_by(&:name)
    songs.each_with_index {|song,i|puts "#{i+1}. #{song.name} - #{song.genre}"}
  end
end