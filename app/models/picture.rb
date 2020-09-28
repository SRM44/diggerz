class Picture < ApplicationRecord
  belongs_to :record

  mount_uploader :photo, PhotoUploader
end
