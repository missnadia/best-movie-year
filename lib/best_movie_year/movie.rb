class BestMovies::Movie
  attr_accessor :title, :year

  def initialize(title = nil, year = nil)
    @title = name
    @year = year
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input.to_i]
  end

  def self.scrape_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movies = []
    movie_year = doc.css(".dropdown-menu").children.css("a").map { |l| l.attribute("href").value }
    movie_title = doc.css("a.unstyled.articleLink").text
    movies << {title: movie_title, year: movie_year}

    movies
  end
end
