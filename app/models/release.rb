class Release < ApplicationRecord
  belongs_to :genre

  mount_uploader :image, PhotoUploader

  has_many :tracks
  has_many :records
  has_many :deals, through: :records

end
