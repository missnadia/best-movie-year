require "nokogiri"
require "open-uri"
require "pry"
class Movie
# class BestMovies::Movie
  attr_accessor :title, :year

  @@all = []

  def initialize(title = nil, year = nil)
    @title = title
    @year = year
    @@all << self
  end

  def self.all
    @@all ||= scrape_years(input)
  end

  def self.reset_all
    @@all.clear
  end

  def self.scrape_years(input)
    # create hash containing inputted movie year & best movie title for that year
    years = []
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=" + "#{input}"))
    year_split = doc.css("h2.panel-heading").first.text.split(" ")
    @year = year_split[4].to_i
    #  movies[year] = {
    # @title = doc.css("table.table a.unstyled.articleLink").text.split("            ").first(11).drop(1)
    # .gsub(/\s+/m, ' ')
    # }
    years << @year
    # @@all = @title
    # movies << @title
    years
  end

  def self.scrape_movies(input)
    movies = {}
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=" + "#{input}"))
    movies[:title] = doc.css("table.table a.unstyled.articleLink").text.split("            ").first(11).drop(1)

    movies
    binding.pry
  end
   Movie.scrape_movies(2000)
end
