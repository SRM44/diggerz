module Deals
  module Reminders
    class First < ApplicationMailer
      def send_to_requester
        @deal = params[:deal]

        mail(
          to:      @deal.requester.email,
          subject: "Tu as un deal en cours !",
        )
      end

      def send_to_receiver
        @deal = params[:deal]

        mail(
          to:      @deal.receiver.email,
          subject: "Tu as un deal en cours !",
        )
      end
    end
  end
end
