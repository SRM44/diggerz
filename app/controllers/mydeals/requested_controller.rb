module Mydeals
  class RequestedController < ApplicationController
    def index
      @deals = current_user.requested_deals.pending.by_most_recent
    end
  end
end
