require_relative "my_enumerable"

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def formats
    ["mp3", "wav", "aac"]
  end

  def each_filename
    formats.each do |format|
      a_string = "#{artist} #{name} #{format}"
      file_names = a_string.gsub(" ", "-")
      yield file_names
    end
  end

  def to_s
    "#<#{self.class.name}:#{object_id}> #{name} by #{artist} duration #{duration}"
  end
end

song1 = Song.new("Okie From Muskogee", "Merle", 162)
song2 = Song.new("Ramblin' Man", "Hank", 184)
song3 = Song.new("Good Hearted Woman", "Waylon", 178)

class Playlist
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each do |song|
      yield song
    end
  end

  def play_songs
    each do |song|
      song.play
    end
  end

  def each_tagline
    each do |song|
      tag_line = "#{song.name} - #{song.artist}"
      yield tag_line
    end
  end

  def each_by_artist(name)
    my_select { |song| song.artist == name }.each {|song| yield song }
  end
end

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

artists = playlist.my_map do |song|
  song.artist
end

puts artists

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }

puts song_labels

non_okie_songs = playlist.my_reject { |song| song.name =~ /Okie/ }

puts non_okie_songs

p playlist.my_detect { |song| song.artist == "Hank" }

p playlist.my_any? { |song| song.artist == "Hank" }

total_duration = playlist.my_reduce do |sum, song|
  sum + song.duration
end
p total_duration
