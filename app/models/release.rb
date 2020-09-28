class Release < ApplicationRecord
  belongs_to :genre

  mount_uploader :image, PhotoUploader

  has_many :tracks
  has_many :records
  has_many :deals, through: :records

  accepts_nested_attributes_for :tracks,
    allow_destroy: true,
    reject_if:     proc { |att| att['title'].blank? }
end
