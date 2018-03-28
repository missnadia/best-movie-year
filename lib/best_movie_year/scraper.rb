class BestMovies::Scraper

  def self.scrape_desc(url)
  titles = {}
  doc = Nokogiri::HTML(open(url))
  titles[:desc] = doc.css("div#movieSynopsis.movie_synopsis.clamp.clamp-6").text.strip

  titles
  end

  def self.scrape_movies(main_url)
    movie_list = []
    doc = Nokogiri::HTML(open("#{main_url}"))
    movies = doc.css("table.table a.unstyled.articleLink")
    movies.each { |movie|
      movie_title = movie.text.split("            ").first(11).drop(1)
      movie_url = "https://www.rottentomatoes.com" + movie.attribute("href").value
      movie_desc = self.scrape_desc("#{movie_url}")
      movie_list << { title: movie_title[0], url: movie_url, desc: movie_desc }
    }

    movie_list
  end
end
