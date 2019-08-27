class MydealsController < ApplicationController
  def index
    @received_deals = current_user.received_deals
    @sended_deals = current_user.requested_deals.with_status(:pending)
    @accepted_deals = current_user.received_deals.with_status(:accepted) || current_user.requested_deals.with_status(:accepted)
    @confirmed_deals = current_user.requested_deals.with_status(:confirmed)
  end

  def show
  end
end
