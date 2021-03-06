module Deals
  module Reminders
    class Second < ApplicationMailer
      def send_to_requester
        @deal = params[:deal]

        mail(
          to:      @deal.requester.email,
          subject: "Tu as un deal en cours ! Plus que 3 jours pour le valider !",
        )
      end

      def send_to_receiver
        @deal = params[:deal]

        mail(
          to:      @deal.receiver.email,
          subject: "Tu as un deal en cours ! Plus que 3 jours pour le valider !",
        )
      end
    end
  end
end
