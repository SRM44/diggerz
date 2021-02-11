module Deals
  module Mailers
    module Receiver
      class Completed < ApplicationMailer
        def send_mail
          @deal = params[:deal]
          @requester, @receiver = @deal.requester, @deal.receiver

          mail(
            to:      @receiver.email,
            subject: subject,
          )
        end

        private

        def subject
          "Votre échange avec #{@requester.username} a été complété ! 🎉"
        end
      end
    end
  end
end
