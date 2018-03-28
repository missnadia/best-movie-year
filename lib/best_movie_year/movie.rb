class BestMovies::Movie
  attr_accessor :title, :desc, :url

  @@all = []

  def initialize(title = nil, desc = nil, url = nil)
    @title = title
    @desc = desc
    @url = url
    @@all << self
  end

  def self.create(movie_array)
    movie_array.each { |movie_hash| self.new(movie_hash) }
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
