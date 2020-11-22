class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # build a class constructor that initializes a song
  # then saves it to the @@all class variable (below, we save using method above) 
  # This method should return the song instance that was initialized and saved. 

  def self.create
    song = Song.new
    song.save
    song
  end


  # build a class constructor Song.new_by_name that takes in the string name
  # of a song and returns a song instance with that name set as its name 
  # property. Should return an instance of Song and not a simple string. 
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save 
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    # simplified by using || ('or') operator instead of conditional statement
  end

  # returns all song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by { |songs| songs.name}
  end

  # Build class constructor that accepts a filename in the format of 
  # "<Artist Name> - <Song Name>.mp3" e.g. "Taylor Swift - Blank Space.mp3"
  # Given Song.new_from_filename("Taylor Swift - Blnk Space.mp3"), the 
  # constructor should return a new Song instance with the song name set to 
  # "Blank Space" and artist name set to Taylor Swift. 
  # Must parse whole song file to get each component, along with .mp3. 

  def self.new_from_filename(song_filename)
    file = song_filename.split(" - ")
    artist_name = file[0]
    name = file[1].gsub(".mp3", "")

    # Return new song instance with song name set to Blank Space
    # and artist name set to Taylor Swift 
    # then return song
    song = self.new
    song.name = name 
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_filename)
    file = song_filename.split(" - ")
    artist_name = file[0]
    name = file[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end



end
