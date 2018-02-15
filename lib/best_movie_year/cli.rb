class BestMovies::CLI

  def call
    puts "Welcome!"
    start
  end

  def start
    input = nil
    while input != "exit"
      puts "Please enter a year from 1950 to 2018 to view the top 10 movies released that year. To exit, please type 'exit':"
      input = gets.strip.to_i
      if input > 1949 && input < 2019
        if movie = BestMovies::Movie.find(input.to_i)
          list_movie(movie)
        end
      else input < 1949 || input > 2018
        start
      end
    end
    puts "Goodbye."
  end

  def list_movie(movie)
    BestMovies::Movie.all.each.with_index(1) { |movie, index| puts "#{index}. #{movie.name}"}
  end
end
