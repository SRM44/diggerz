module Users
  class SessionsController < Devise::SessionsController
    private

    def after_sign_in_path_for(resource)
      myrecords_path
    end
  end
end
