class Release < ApplicationRecord
  belongs_to :genre
  has_many :tracks
  has_many :records
  has_many :deals, through: :records
end
