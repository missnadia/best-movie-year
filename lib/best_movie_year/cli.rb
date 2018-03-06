class BestMovies::CLI

  def call
    puts "Welcome!"
    start
  end

  def print_movies(input)
    movie = BestMovies::Movie.new
    BestMovies::Movie.all.each.with_index(1) { |movie, index| puts "#{index}. #{BestMovies::Movie.title}" }
  end

  def start
    puts "Please enter a four-digit year from 1950 to 2018 to view the top movie of that year. To exit, please type 'exit':"
    input = gets.strip
    if input.to_i >= 1950 && input.to_i <= 2018
      puts ""
      puts "Top 10 Movies of #{input.to_i}"
      BestMovies::Movie.scrape_years(input)
      print_movies(input)
    elsif input.downcase == "exit"
      puts "Goodbye."
    else
      puts "Invalid entry."
      start
    end
  end
end
