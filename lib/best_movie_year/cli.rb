class BestMovies::CLI

  def call
    puts "Welcome!"
    start
  end

  def start
    input = nil
    while input != "exit"
      puts "Please enter a year from 1950 to 2018 to view the top 10 movies released that year:"
      input = gets.chomp
      if input > 1949 && input < 2019
        search_movie
      else input < 1949 || input > 2018
        start
      end
    end
  end
end
