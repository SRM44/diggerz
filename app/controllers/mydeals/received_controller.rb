module Mydeals
  class ReceivedController < ApplicationController
    def index
      @deals = current_user.received_deals.pending.by_most_recent
    end
  end
end
