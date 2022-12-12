class Platform < ApplicationRecord
  has_one_attached :photo
  has_many :movie_platforms
  has_many :movies, through: :movie_platforms
  has_many :favourite_platforms
end
