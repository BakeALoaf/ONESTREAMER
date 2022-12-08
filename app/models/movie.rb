class Movie < ApplicationRecord
  has_many :favourite_movies

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }
end
