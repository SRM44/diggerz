class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

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
  end
end
