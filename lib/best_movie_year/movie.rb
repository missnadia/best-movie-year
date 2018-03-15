require "nokogiri"
require "open-uri"
require "pry"

#class Movie
class BestMovies::Movie
  attr_accessor :title, :desc, :url

  @@all = []

  def initialize(movie_hash)
    movie_hash.each { |attribute, value|
      self.send("#{attribute}=", value)
    }
    @@all << self
  end

  def self.create(movie_array)
    movie_array.each { |movie_hash|
      @movie = self.new(movie_hash)
      @movie.add_value(movie_hash)
    }
  end

  def add_value(desc_hash)
    desc_hash.each { |attr, value|
      self.send("#{attr}=", value)
    }
    self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  #def self.scrape_years(input)
    # create hash containing inputted movie year & best movie title for that year
  #  years = []
  #  doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=" + "#{input}"))
  #  year_split = doc.css("h2.panel-heading").first.text.split(" ")
  #  @year = year_split[4].to_i
    #  movies[year] = {
    # @title = doc.css("table.table a.unstyled.articleLink").text.split("            ").first(11).drop(1)
    # .gsub(/\s+/m, ' ')
    # }
  # years << @year
    # @@all = @title
    # movies << @title
  #  years
  #end

  def self.scrape_movies(main_url)
    #doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=" + "#{input}"))
    movie_list = []
    doc = Nokogiri::HTML(open("#{main_url}"))
    movies = doc.css("table.table a.unstyled.articleLink")
    movies.each { |movie|
      movie_title = movie.text.split("            ").first(11).drop(1)
      movie_url = "https://www.rottentomatoes.com" + movie.attribute("href").value
      movie_desc = @movie.scrape_desc(movie_url)
      movie_list << {title: movie_title[0], url: movie_url, desc: movie_desc}
    }

    movie_list
  end
# Movie.scrape_movies("https://www.rottentomatoes.com/top/bestofrt/?year=2000")

  def self.scrap_desc(url)
    movies = {}
    doc = Nokogiri::HTML(open(url))
    movies[:desc] = doc.css("div#movieSynopsis.movie_synopsis.clamp.clamp-6").text.strip

    movies
  end
  # Movie.scrap_desc("https://www.rottentomatoes.com/m/chicken_run")
end
