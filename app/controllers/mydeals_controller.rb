class MydealsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :set_deal]
  before_action :set_deal, only: [:show]

  def index
    @received_deals  = current_user.received_deals.pending
    @confirmed_deals = current_user.received_deals.accepted

    @sent_deals     = current_user.requested_deals.pending
    @accepted_deals = current_user.requested_deals.accepted
  end

  def show
    @proposed_record = @deal.requester_record
    @asked_record    = @deal.receiver_record
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end
end
