class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self  #ask why? why not just @@all or self.all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|instance| instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    found = self.find_by_name(song_name)
    create = self.create_by_name(song_name)
    found ? found : create
  end

  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
  end

  def self.new_from_filename(song_mp3)
    song_array = song_mp3.slice(0..-5).split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1]
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(song_mp3)
    song_array = song_mp3.slice(0..-5).split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1]
    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end

end
