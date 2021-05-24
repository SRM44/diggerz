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

    @deal.receiver  = @record.user
    @deal.requester = current_user

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

    if @deal.canceled?
      # Requester canceled then receiver confirmed, awkward!
      flash.notice = "Le deal a été entre temps annulé par #{@deal.requester.username}."
      redirect_to mydeal_path(@deal) and return
    else
      if @deal.accept!
        Deals::Mailers::Requester::Accepted.with(deal: @deal).send_mail.deliver_now
        Deals::Mailers::Receiver::Accepted.with(deal: @deal).send_mail.deliver_now

        redirect_to mydeal_path(@deal)
      end
    end
  end

  def decline
    @deal = Deal.find(params[:id])
    @deal.decline

    if @deal.save
      Deals::Mailers::Requester::Declined.with(deal: @deal).send_mail.deliver_now

      redirect_to mydeal_path(@deal)
    end
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
      # Requester canceled then receiver confirmed, awkward!
      Deals::Mailers::Admin::CanceledAfterFirstConfirmation.with(deal: @deal).send_mail.deliver_now

      flash.notice = "Le deal a été annulé par #{@deal.requester.username}. Un administrateur Diggerz a été notifié et reviendra vers vous sous peu."
      redirect_to mydeal_path(@deal) and return
    else
      @deal.confirm_for(current_user)
      @deal.save
    end

    if @deal.completed?
      Deals::Mailers::Requester::Completed.with(deal: @deal).send_mail.deliver_now
      Deals::Mailers::Receiver::Completed.with(deal: @deal).send_mail.deliver_now
    end

    redirect_to mydeal_path(@deal)
  end

  private

  def deal_params
    params.require(:deal).permit(:requester_record_id)
  end
end
