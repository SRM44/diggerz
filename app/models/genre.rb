class Genre < ApplicationRecord
  has_many :users, through: :preferences
  has_many :releases

  validates :name, uniqueness: true
end
