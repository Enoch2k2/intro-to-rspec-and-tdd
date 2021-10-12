class Video
  attr_accessor :title, :duration, :genre, :rating

  @@all = []

  def initialize(title, duration, genre, rating)
    @title = title
    @duration = duration
    @genre = genre
    @rating = rating
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(title, duration, genre, rating)
    video = self.new(title, duration, genre, rating)
    video.save
    video
  end
end