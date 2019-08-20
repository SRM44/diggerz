class Release < ApplicationRecord
  belongs_to :genre

  mount_uploader :image, PhotoUploader
end
