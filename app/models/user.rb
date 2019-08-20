class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :records
  has_many :preferences
  has_many :genres, through: :preferences
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  mount_uploader :avatar, PhotoUploader

  def self.find_for_discogs_oauth(auth)
    user_params = {
      username:   auth.info.username,
      avatar:     auth.info.picture,
      email:      auth.info.username.downcase + '@diggerz-user.com',
      discogs_id: auth.uid,
      provider:   auth.provider,
      token:      auth.credentials.token
    }

    user = User.find_by(provider: auth.provider, discogs_id: auth.uid)
    user ||= User.find_by(email: user_params["email"]) # User did a regular sign up in the past.

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save!
    end
    return user


  def received_deals
    Deal.where(receiver_record_id: record_ids)
  end

  def requested_deals
    Deal.where(requester_record_id: record_ids)
  end
end
