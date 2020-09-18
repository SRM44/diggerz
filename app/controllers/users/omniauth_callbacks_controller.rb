class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:discogs]

  # 1. Signup w/  Discogs -> discogs_id present
  # 2. Signup w/o Discogs -> discogs_id !present
  #   2b. Connect discogs account
      # - keep current email address
      # - save discogs metadata

  def discogs
    if user_signed_in?
      save_discogs_metadata
      redirect_to myrecords_path

    else
      user = User.find_for_discogs_oauth(auth)

      if user.persisted?
        session[:access_token] = request.env['omniauth.auth'].extra.access_token
        set_flash_message(:notice, :success, kind: 'Discogs') if is_navigational_format?
        sign_in(:user, user) unless user_signed_in?

        redirect_to myrecords_path
      else
        session['devise.discogs_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
  end

  private
  def save_discogs_metadata
    current_user.update(
      username:     auth.info.username,
      discogs_id:   auth.uid,
      provider:     auth.provider,
      token:        auth.credentials.token,
      secret_token: auth.credentials.secret
    )
  end

  def auth
    request.env['omniauth.auth']
  end
end
