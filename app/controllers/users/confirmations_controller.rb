class Users::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_resending_confirmation_instructions_path_for(resource_name)
    user_signed_in? ? profile_path : super
  end
end
