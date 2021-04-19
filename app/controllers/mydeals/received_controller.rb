module Mydeals
  class ReceivedController < ApplicationController
    skip_before_action :redirect_user_without_confirmed_email!

    def index
      @received_deals = current_user.received_deals.pending.by_most_recent

      set_invite_user_to_add_records
    end

    private

    def set_invite_user_to_add_records
      @invite_user_to_add_records = @received_deals.blank?
    end
  end
end
