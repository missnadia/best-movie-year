require "bundler/setup"
Bundler.require(:default)

require "pry"
require "nokogiri"
require "open-uri"
require_relative "../lib/best_movie_year/cli"
require_relative "../lib/best_movie_year/movie"
require_relative "../lib/best_movie_year/version"
require_relative "../lib/best_movie_year/scraper"
