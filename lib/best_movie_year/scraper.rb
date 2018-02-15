class BestMovies::Scraper

  def self.scrape_movies(url)
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=2018"))
    movies = []
    movie_list.css("div.btn-group btn-primary-border-dropdown").each do |list|
      movie_year = list.css("fontelloIcon icon-down-dir pull-right").text
      years = list.css(".class dropdown-menu").children.css("a").map { |y| y.attribute("href").value }
        years.each.do |year|
          movie_name = year.css(".unstyled articleLink").text
          movies << {year: movie_year, name: movie_name}
        end
      end
    end
  end
  movies
end
