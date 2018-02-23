class BestMovies::Movie
  attr_accessor :title, :year

  def initialize(title = nil, year = nil)
    @title = title
    @year = year
    @@all << self
  end

  def self.all
    @@all ||= scrape_movies
  end

  def self.find(input)
    self.all[input]
  end

  def self.scrape_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movie_years = []
    movie_year = doc.css(".dropdown-menu").children.css("a").map { |l| l.attribute("href").value }
    movie_title = doc.css("a.unstyled.articleLink").text
    movie_years << {title: movie_title, year: movie_year}

    movie_years
  end
end
