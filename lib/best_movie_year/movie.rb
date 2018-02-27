class BestMovies::Movie
  attr_accessor :title, :year, :year_url

  @@all = []
  
  def initialize
    years_hash.each { |attribute, value| self.send("#{attribute}=", value) }
    @@all << self
  end

  def self.all
    @@all ||= scrape_movies
  end

  def self.find(input)
    self.all[input]
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
    movies[:title] = doc.css("a.unstyled.articleLink").children.css("a").map { |t| t.text }
    
    movies
  end
end
