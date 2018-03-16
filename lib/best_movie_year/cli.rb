#class CLI
class BestMovies::CLI

  BASE_PATH = "https://www.rottentomatoes.com"

  def call
    puts "Welcome!"
    start
  end

  def make_movies(input)
    movie_array = BestMovies::Movie.scrape_movies(BASE_PATH + "/top/bestofrt/?year=" + input)
    BestMovies::Movie.create(movie_array)
  end

  def make_desc
    BestMovies::Movie.all.each { |movie|
    add_desc = BestMovies::Movie.scrape_desc(BASE_PATH + "#{movie.url}")
    movie.add_value(add_desc)
    }
  end

  def diff_year
    puts "Would you like to enter a different year? (Y/N)"
    input_2 = gets.strip
    puts ""
    if input_2.downcase == "n"
      puts "Goodbye."
    elsif input_2.downcase == "y"
      start
    else
      puts "Invalid entry. Please enter Y or N"
      puts ""
      diff_year
    end
  end

  def print_movies
    BestMovies::Movie.all.first(10).each.with_index(1) { |movie, i|
        puts "#{i}. #{movie.title[:title]}"
    }
    puts ""
    puts "Would you like more information? (Y/N)"
    input_1 = gets.strip
    if input_1.downcase == "y"
      #make_desc
      puts "movie info"
      puts ""
      diff_year
    elsif input_1.downcase == "n"
      puts ""
      diff_year
    else
      puts ""
      puts "Invalid entry. Please enter Y or N"
      print_movies
    end
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
      puts ""
      puts "Invalid entry."
      start
    end
  end
end
