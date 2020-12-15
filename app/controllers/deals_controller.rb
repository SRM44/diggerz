class DealsController < ApplicationController
  def new
    @record    = Record.find(params[:record_id])
    @myrecords = current_user.records.swappable

    @deal = Deal.new
  end

  def create
    @record = Record.find(params[:record_id])
    @deal = Deal.new(deal_params)
    @deal.receiver_record_id = @record.id

    if @deal.save
      redirect_to mydeals_path
    else
      render :new
    end
  end

  def accept
    @deal = Deal.find(params[:id])
    @deal.status = 'accepted'
    @deal.save
    redirect_to mydeals_path
  end

  def decline
    @deal = Deal.find(params[:id])
    @deal.status = 'declined'
    @deal.save
    redirect_to mydeals_path
  end

  private

  def deal_params
    params.require(:deal).permit(:requester_record_id)
  end
end
