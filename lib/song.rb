
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
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
    self.all.find{|songs| songs.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
    #really need to look into difference between sort and sort_by Documentation not good- First blog post?
  end

  def self.new_from_filename(mp3_file)
   #Cleen up
   song = mp3_file.split(" - ")
   song_name = song[1]
   song_name = song_name.split(".")
   song_name = song_name[0]
   song_artist = song[0]
   #Create new
   song = self.new
   song.name = song_name
   song.artist_name = song_artist
   song
  end

  def self.create_from_filename(mp3_file)
    song = mp3_file.split(" - ")
    song_name = song[1]
    song_name = song_name.split(".")
    song_name = song_name[0]
    song_artist = song[0]

    song = self.create
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
