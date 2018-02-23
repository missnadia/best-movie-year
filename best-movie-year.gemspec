
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_movie_year/version"

Gem::Specification.new do |spec|
  spec.name          = "best-movie-year"
  spec.version       = BestMovies::VERSION
  spec.authors       = ["'Nadia Lee'"]
  spec.email         = ["'miss.nadia.lee@gmail.com'"]

  spec.summary       = %q{Top 10 Movies by Year}
  spec.description   = %q{Lists the top 10 movies of a given year rated by Rotten Tomatoes.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["best-movie-year"]
  spec.require_paths = ["lib", "lib/best_movie_year"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
