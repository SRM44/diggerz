class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :records
  has_many :preferences
  has_many :genres, through: :preferences

  def received_deals
    Deal.where(receiver_record_id: record_ids)
  end

  def requested_deals
    Deal.where(requester_record_id: record_ids)
  end
end
