class Movie < ApplicationRecord
  has_many :favourite_movies
  has_many :movie_platforms
  has_many :platforms, through: :movie_platforms
end
