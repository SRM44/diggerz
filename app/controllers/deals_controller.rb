class DealsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :accept, :decline, :import_from_discogs]

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
