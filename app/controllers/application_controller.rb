class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :redirect_user_without_confirmed_email!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def redirect_user_without_confirmed_email!
    if current_user&.confirmed_at.nil? && !devise_controller? && controller_name != 'confirmations'
      flash[:alert] = "Tu dois confirmer ton email avant de pouvoir accéder à cette page"
      redirect_to new_user_confirmation_path
    end
  end
end
