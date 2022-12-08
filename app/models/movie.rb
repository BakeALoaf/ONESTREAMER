class Movie < ApplicationRecord
  has_many :favourite_movies

  has_many :movie_platforms
  has_many :platforms, through: :movie_platforms


  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

end
