class BestMovies::Movie
  attr_accessor :title

  @@all = []

  def initialize(title = nil)
    @title = title
    @@all << self
  end

  def self.all
    @@all ||= BestMovies::Scraper.scrape_years(input)
  end

  def self.reset_all
    @@all.clear
  end

  def self.scrape_years(input)
    # create hash containing inputted movie year & best movie title for that year
    movie = []
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2000"))
    # iterate over each year and scrape year
    @title ||= doc.css("table.table a.unstyled.articleLink").first.text
    movie << @title

    movie
  end
end
