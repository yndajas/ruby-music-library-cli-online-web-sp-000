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
    input = nil
    until input == "exit" do
      input = gets
      self.list_songs if input == "list songs"
      self.list_artists if input == "list artists"
      self.list_genres if input == "list genres"
      self.list_songs_by_artist if input == "list artist"
      self.list_songs_by_genre if input == "list genre"
      self.play_song if input == "play song"
    end
  end
  
  def alphabetize(ob)
    ob.sort_by(&:name)
  end
  
  def list_songs
    songs = alphabetize(Song.all)
    songs.each_with_index {|song,i|puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    artists = alphabetize(Artist.all)
    artists.each_with_index {|artist,i|puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    genres = alphabetize(Genre.all)
    genres.each_with_index {|genre,i|puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets)
    if artist
      songs = alphabetize(artist.songs)
      songs.each_with_index {|song,i|puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets)
    if genre
      songs = alphabetize(genre.songs)
      songs.each_with_index {|song,i|puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    number = gets.to_i
    if number > 0 && number <= Song.all.count
      song = alphabetize(Song.all)[number-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end