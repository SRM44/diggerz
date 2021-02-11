module Deals
  module Mailers
    module Requester
      class Accepted < ApplicationMailer
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
          "Votre proposition d'échange a été acceptée ! 🎉"
        end
      end
    end
  end
end
