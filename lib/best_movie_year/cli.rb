class BestMovies::CLI

  BASE_PATH = "https://www.rottentomatoes.com/top/bestofrt/?year="

  def call
    puts "Welcome!"
    start
  end

  def make_movies(input)
    movie_array = BestMovies::Scraper.scrape_movies(BASE_PATH + input)
    BestMovies::Movie.create(movie_array)
  end

  def print_movies
    BestMovies::Movie.all.first(10).each.with_index(1) { |movie, i|
      puts "#{i}. #{movie.title[:title]}"
      url = "#{movie.title[:url]}"
      BestMovies::Scraper.scrape_desc(url)
    }
    puts ""
    add_info
  end

  def print_desc
    BestMovies::Movie.all.first(10).each.with_index(1) { |movie, i|
      puts "#{i}. #{movie.title[:desc][:desc]}"
      puts ""
    }
  end

  def add_info
    puts "Would you like more information? (Y/N)"
    input = gets.strip
    if input.downcase == "y"
      puts ""
      print_desc
      puts ""
      diff_year
    elsif input.downcase == "n"
      puts ""
      diff_year
    else
      puts ""
      puts "Invalid entry. Please enter Y or N"
      puts ""
      print_movies
    end
  end

  def diff_year
    puts "Would you like to enter a different year? (Y/N)"
    input = gets.strip
    if input.downcase == "n"
      puts ""
      puts "Goodbye."
    elsif input.downcase == "y"
      puts ""
      BestMovies::Movie.reset_all
      start
    else
      puts "Invalid entry. Please enter Y or N."
      puts ""
      diff_year
    end
  end

  def start
    puts "Please enter a four-digit year from 1950 to 2018 to view the top 10 movies of that year. To exit, please type 'EXIT':"
    input = gets.strip
    if input.to_i >= 1950 && input.to_i <= 2018
      make_movies(input)
      puts ""
      puts "Top 10 Movies of #{input.to_i}"
      print_movies
    elsif input.downcase == "exit"
      puts ""
      puts "Goodbye."
    else
      puts ""
      puts "Invalid entry."
      puts ""
      start
    end
  end
end
