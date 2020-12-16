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
    @deal.accept
    @deal.save

    redirect_to mydeal_path(@deal)
  end

  def decline
    @deal = Deal.find(params[:id])
    @deal.decline
    @deal.save

    redirect_to mydeal_path(@deal)
  end

  def cancel
    @deal = Deal.find(params[:id])
    @deal.cancel
    @deal.save

    redirect_to mydeal_path(@deal)
  end

  def confirm
    @deal = Deal.find(params[:id])
    @deal.confirm_for(current_user)
    @deal.save

    if @deal.completed
      redirect_to completed_deal_path(@deal)
    else
      redirect_to mydeal_path(@deal)
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:requester_record_id)
  end
end
