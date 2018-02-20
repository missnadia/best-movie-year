class BestMovies::Scraper

  def self.scrape_movies(url)
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movies = []
    movie_list.css("div.btn-group btn-primary-border-dropdown").each do |list|
      list.css(".class dropdown-menu").children.css("a").map { |l| l.attribute("href").value }
      years.each.do |year|
        movie = year.css(".unstyled articleLink").text
        movies << {name: movie}
      end
    end
  end
  movies
end
