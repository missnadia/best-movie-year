require "nokogiri"
require "open-uri"
require "pry"

class BestMovies::Movie
  attr_accessor :title, :year

  @@all = []

  def initialize(title = nil)
    @title = title
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
    # movie = []
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=" + "#{input}"))
    # year = doc.css("h2.panel-heading").first.text.split(" ")
    # movie[year[4]] = {
    title = doc.css("table.table a.unstyled.articleLink").text.split("            ").first(11)
    # .gsub(/\s+/m, ' ')
    # }

    @@all << title[1..10]
    @@all
  end
  # Movie.scrape_years(1990)
end
