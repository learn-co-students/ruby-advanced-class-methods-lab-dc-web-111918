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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name_song)
    song = self.new
    song.name = name_song
    song
  end

  def self.create_by_name(name_song)
    song = self.new
    song.name = name_song
    @@all << song
    song
  end

  def self.find_by_name(name_song)
    @@all.find do |song|
      song.name == name_song
    end
  end

  def self.find_or_create_by_name(name_song)
    find_by_name(name_song) || create_by_name(name_song)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    new_file = filename.slice(0..-5).split(" - ")
    song = self.new
    song.name = new_file[1]
    song.artist_name = new_file[0]
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.slice(0..-5).split(" - ")
    song = self.new
    song.name = new_file[1]
    song.artist_name = new_file[0]
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
