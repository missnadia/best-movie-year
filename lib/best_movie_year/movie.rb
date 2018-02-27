class BestMovies::Movie
  attr_accessor :title, :year, :year_url

  @@all = []
  
  def initialize(title = nil, year = nil, year_url = nil)
    @title = title
    @year = year
    @year_url = year_url
    @@all << self
  end

  def self.all
    @@all ||= scrape_movies
  end

  def self.find(input)
    self.all.detect { |y| y.input.to_s == 
  end

  def self.scrape_years
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movie_years = []
    
    year_url = doc.css(".dropdown-menu").children.css("a").map { |l| l.attribute("href").value }
    movie_year = doc.css(".dropdown-menu").children.css("a").map { |y| y.text }
    movie_years << { year_url: year_url, year: movie_year }

    movie_years
  end
  
  def self.scrape_movies(year_url)
    movies = {}
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com#{year_url}"))
    10.times do
      movies[:title] = doc.css("a.unstyled.articleLink").children.css("a").map { |t| t.text }
    end
    
    movies
  end
end
