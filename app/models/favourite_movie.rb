class FavouriteMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
