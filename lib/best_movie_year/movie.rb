class BestMovies::Movie
  attr_accessor :name, :year

  def initialize(name = nil, year = nil)
    @name = name
    @year = year
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end
end
