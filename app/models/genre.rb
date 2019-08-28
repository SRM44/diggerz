class Genre < ApplicationRecord
  has_many :users, through: :preferences
  has_many :releases

  validates :name, uniqueness: true

  SAVED_IMAGE_GENRES = ["blues", "folk", "jazz", "pop", "reggae", "rock", "electronic", "classical", "funksoul"]
end
