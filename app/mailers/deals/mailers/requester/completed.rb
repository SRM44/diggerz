module Deals
  module Mailers
    module Requester
      class Completed < ApplicationMailer
        def send_mail
          @deal = params[:deal]
          @requester, @receiver = @deal.requester, @deal.receiver

          mail(
            to:      @requester.email,
            subject: subject,
          )
        end

        private

        def subject
          "Votre échange avec #{@receiver.username} a été complété ! 🎉"
        end
      end
    end
  end
end
