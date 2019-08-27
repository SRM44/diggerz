class Track < ApplicationRecord
  belongs_to :release

  validates :title, presence: true
  validates :position, presence: true
end
