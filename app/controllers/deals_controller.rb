class DealsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!

  def new
    @record    = Record.find(params[:record_id])
    @myrecords = current_user.records.swappable

    @deal = Deal.new
  end

  def create
    @record = Record.find(params[:record_id])
    @deal   = Deal.new(deal_params)

    @deal.receiver_record_id = @record.id

    if @deal.save
      Deals::Mailers::Requester::Created.with(deal: @deal).send_mail.deliver_now
      Deals::Mailers::Receiver::Created.with(deal: @deal).send_mail.deliver_now

      redirect_to requested_mydeals_path
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

    if @deal.canceled?
      # TODO: send email to Steven
      # Requester canceled while receiver confirmed, awkward!
      flash.notice = "Le deal a été annulé par #{@deal.requester.username}. Un administrateur Diggerz a été notifié et reviendra vers vous sous peu."
      redirect_to mydeal_path(@deal) and return

    else
      @deal.confirm_for(current_user)
      @deal.save
    end

    if @deal.completed?
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
