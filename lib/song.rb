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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
    # binding.pry
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
    # binding.pry
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      if song.name == song_name
        return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      @@all.each do |song_obj|
        return song_obj if song_obj.name == song_name
      end
    end
    create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    song_array = filename.split(" - ")
    song_name = song_array[1]
    artist_name = song_array[0]

    # binding.pry
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song

  end
  
  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    song_array = filename.split(" - ")
    song_name = song_array[1]
    artist_name = song_array[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song

  end

  def self.destroy_all
    @@all.clear
  end

end
