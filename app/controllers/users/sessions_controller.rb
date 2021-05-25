module Users
  class SessionsController < Devise::SessionsController
    def new
      session[:record_to_return_to_id] = params[:record_to_return_to_id].presence
      super
    end

    private

    def after_sign_in_path_for(resource)
      record_to_return_to_id = session.delete(:record_to_return_to_id)

      if record_to_return_to_id
        @record_to_return_to = Record.find_by(id: record_to_return_to_id)

        if @record_to_return_to && record_not_owned_by_user?
          new_record_deal_path(@record_to_return_to)
        else
          records_path
        end
      else
        myrecords_path
      end
    end

    def record_not_owned_by_user?
      !current_user.records.include?(@record_to_return_to)
    end
  end
end
