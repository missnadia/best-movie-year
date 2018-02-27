class BestMovies::CLI

  def call
    puts "Welcome!"
    start
  end

  def print_movies
    BestMovies::Movie.all.each.with_index(1) { |movie, index| puts "#{index}. #{movie.title}" }
  end

  def start
    puts "Please enter a four-digit year from 1950 to 2018 to view the top 10 movies of that year. To exit, please type 'exit':"
    input = gets.strip
    if input.to_i >= 1950 && input.to_i <= 2018
      BestMovies::Movie.find(input.to_i)
      puts ""
      puts "Top 10 Movies of #{input.to_i}"
      print_movies
    elsif input.to_i < 1950 || input.to_i > 2018
      puts "Invalid entry."
      start
    elsif input.downcase == "exit"
      puts "Goodbye."
    else
      start
    end
  end
end
