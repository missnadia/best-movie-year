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

  def self.scrape_years(url)
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movies = []
    movie_list.css(".class dropdown-menu").children.css("a").map { |l| l.attribute("href").value }
    years.each.do |year|
      movie = year.css("a.unstyled.articleLink").text
      movies << movie
    end
    movies
  end

  def self.scrape_movies(year_url)
    movies = []
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{year}"))
    movie_list.css("a.unstyled.articleLink").map { |l| l.text }
    movies << movie
  end
end
