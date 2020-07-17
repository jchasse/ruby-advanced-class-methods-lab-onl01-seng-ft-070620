require "pry"

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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song_inst|
      song_inst.name
    end
  end

  def self.new_from_filename (filename)
    song = self.new
    temp_array = filename.split(" - ")
    # binding.pry
    song.artist_name = temp_array[0]
    song.name = temp_array[1].chomp (".mp3") #need to figure out a way to remove the .mp3
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end
