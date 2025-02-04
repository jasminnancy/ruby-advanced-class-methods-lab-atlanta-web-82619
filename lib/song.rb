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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |n| n.name }
  end

  def self.new_from_filename(filename)
    part = filename.split(" - ")
    song = self.new
    song.artist_name = part[0]
    song.name = part[1].delete_suffix(".mp3")
    song
  end

  def self.create_from_filename(filename)
    part = filename.split(" - ")
    song = self.create
    song.artist_name = part[0]
    song.name = part[1].delete_suffix(".mp3")
    song
  end

  def self.destroy_all
    self.all.clear
  end
end