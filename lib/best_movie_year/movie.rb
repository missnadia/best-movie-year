class BestMovies::Movie
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end
end
