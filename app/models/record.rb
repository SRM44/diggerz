class Record < ApplicationRecord
  belongs_to :user
  belongs_to :release

  has_many :pictures, dependent: :destroy

end
