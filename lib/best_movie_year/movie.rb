require "nokogiri"
require "open-uri"
require "pry"

# class Movie
class BestMovies::Movie
  attr_accessor :title, :desc, :url

  @@all = []

  def initialize(title = nil, desc = nil, url = nil)
    @title = title
    @desc = desc
    @url = url
    @@all << self
  end

  def self.create(movie_array)
    movie_array.each { |movie_hash|
      @movie = self.new(movie_hash)
    #  @movie.add_value(add_desc)
    }
  end

  #def add_value(add_desc)
  #  add_desc.each { |attribute, value|
  #    self.send("#{attribute}=", value)
  #  }
  #  self
  #end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.scrape_movies(main_url)
    movie_list = []
    doc = Nokogiri::HTML(open("#{main_url}"))
    movies = doc.css("table.table a.unstyled.articleLink")
    movies.each { |movie|
      movie_title = movie.text.split("            ").first(11).drop(1)
      movie_url = "https://www.rottentomatoes.com" + movie.attribute("href").value
      movie_list << {title: movie_title[0], url: movie_url}
    }

    movie_list
  end
# Movie.scrape_movies("https://www.rottentomatoes.com/top/bestofrt/?year=2000")

  def self.scrape_desc(url)
    titles = []
    doc = Nokogiri::HTML(open(url))
    movie_desc = doc.css("div#movieSynopsis.movie_synopsis.clamp.clamp-6").text.strip
    titles << {desc: movie_desc}

    titles
  end
   #Movie.scrape_desc("https://www.rottentomatoes.com/m/chicken_run")
end
