module Mydeals
  skip_before_action :redirect_user_without_confirmed_email!
  class ReceivedController < ApplicationController
    def index
      @deals = current_user.received_deals.pending.by_most_recent
    end
  end
end
