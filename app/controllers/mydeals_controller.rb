class MydealsController < ApplicationController
  before_action :set_deal, only: [:show]

  def index
    @received_deals = current_user.received_deals.with_status(:pending)
    @sended_deals = current_user.requested_deals.with_status(:pending)
    @accepted_deals = current_user.received_deals.with_status(:accepted) || current_user.requested_deals.with_status(:accepted)
    @confirmed_deals = current_user.requested_deals.with_status(:confirmed)
  end

  def show
    @proposed_record = @deal.requester_record
    @asked_record = @deal.receiver_record
  end

  def accept
    @deal.status = 'accepted'
    @deal.save
    redirect_to mydeals_path
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end
end
