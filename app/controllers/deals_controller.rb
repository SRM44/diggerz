class DealsController < ApplicationController
  def new
    @record = Record.find(params[:record_id])
    @myrecords_all = current_user.records
    @myrecords = []
    @myrecords_all.each do |myrecord|
      @myrecords << myrecord if myrecord.swappable
    end
    @deal = Deal.new
  end

  def create
    @record = Record.find(params[:record_id])
    @deal = Deal.new(deal_params)
    @deal.receiver_record_id = @record.id

    if @deal.save # false si les validations ne passent pas
      redirect_to mydeals_path
    else
      render :new # template de views/reviews/new.html.erb
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:requester_record_id)
  end
end
