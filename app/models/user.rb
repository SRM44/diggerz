class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :records
  has_many :releases, through: :records
  has_many :preferences
  has_many :genres, through: :preferences

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  devise :omniauthable, omniauth_providers: [:discogs]

  mount_uploader :avatar, PhotoUploader

  validates :accepts_tos,
    inclusion: { in: [true], message: ->(_, _) { "Accepter les conditions d'utilisation est obligatoire" }},
    on:        :create

  validates :username, presence: { message: "doit être rempli" }

  # before_create :set_default_avatar

  def self.find_for_discogs_oauth(auth)
    user_params = {
      username:    auth.info.username,
      avatar:      auth.info.picture,
      email:       auth.info.username.downcase + '@diggerz-user.com',
      discogs_id:  auth.uid,
      provider:    auth.provider,
      token:       auth.credentials.token,
      accepts_tos: true
    }

    user = User.find_by(provider: auth.provider, discogs_id: auth.uid)
    user ||= User.find_by(email: user_params["email"])

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save!
    end

    return user
  end

  def received_deals
    @received_deals ||= Deal.where(receiver_id: id)
  end

  def requested_deals
    @requested_deals ||= Deal.where(requester_id: id)
  end

  def location
    self[:location] || User::Location.available.first
  end

  def admin?
    [
      "nfilzi.webservices@gmail.com",
      "nfilzi@diggerz-user.com",
      "steven@diggerz.fr"
    ].include? email
  end

  # def set_default_avatar
  #   <% default_picture = (image_path 'default_profile.png') %>
  #   <%= f.input :avatar, input_html: {value: '#{default_picture}'}, label: false %>
  # end
end
