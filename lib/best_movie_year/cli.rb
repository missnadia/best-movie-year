#class CLI
class BestMovies::CLI

  BASE_PATH = "https://www.rottentomatoes.com/top/bestofrt/?year="

  def call
    puts "Welcome!"
    start
  end

  def make_movies(input)
    BestMovies::Movie.scrape_movies(BASE_PATH + input)
  end

  def print_movies
    # movie = BestMovies::Movie.new
    BestMovies::Movie.all.each.with_index(1) { |title, i| puts "#{i}. #{BestMovies::Movie.title}" }
  end

  def start
    puts "Please enter a four-digit year from 1950 to 2018 to view the top 10 movies of that year. To exit, please type 'exit':"
    input = gets.strip
    if input.to_i >= 1950 && input.to_i <= 2018
      make_movies(input)
      puts ""
      puts "Top 10 Movies of #{input.to_i}"
      print_movies
    elsif input.downcase == "exit"
      puts "Goodbye."
    else
      puts "Invalid entry."
      start
    end
  end
end
