class Genre < ApplicationRecord
  SAVED_IMAGE_GENRES = [
    "blues",
    "brass-military",
    "children-s",
    "classical",
    "electronic",
    "folk-world-country",
    "funk-soul",
    "jazz",
    "latin",
    "non-music",
    "pop",
    "reggae",
    "rock",
    "stage-screen"
  ]

  has_many :users, through: :preferences
  has_many :releases

  validates :name, uniqueness: true
end
