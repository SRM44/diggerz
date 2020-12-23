# Première phase
# 2a. Un receiver decline un deal => :declined
# 2b. Un requester cancel un deal => :canceled
# 2c. Un receiver accepte un deal => :accepted

# Deuxième phase
# ✅ 3. Receiver | Requester confirm un deal => :confirmed_by_X
# ✅ 3a. Other party confirm un deal => :completed

# To implement higher in abstraction
# 3b. Other party does nothing => :completed after 24 hours
# ✅ 3c. Receiver canceled => :canceled  + mail à Steven

class Deal
  class Confirmation
    CONFIRMATION_STATUSES = [:confirmed_by_requester, :confirmed_by_receiver]

    attr_reader :deal, :user, :deal_initial_status

    def initialize(deal, user)
      @deal, @user = deal, user

      @deal_initial_status = @deal.status
    end

    def process
      if waiting_for_other_user_confirmation?
        deal.status = :completed

        swap_records_owners
      else
        deal.status = "confirmed_by_#{user_context}".to_sym
      end

      set_status_changed_timestamp
    end

    def waiting_for_other_user_confirmation?
      CONFIRMATION_STATUSES.include?(deal_initial_status.to_sym)
    end

    private

    def set_status_changed_timestamp
      deal[status_changed_timestamp_column] = DateTime.current
    end

    def user_context
      deal.receiver.id == user.id ? "receiver" : "requester"
    end

    def status_changed_timestamp_column
      "#{deal.status}_at".to_sym
    end

    def swap_records_owners
      original_receiver_id  = deal.receiver_record.user_id
      original_requester_id = deal.requester_record.user_id

      deal.receiver_record.user_id  = original_requester_id
      deal.requester_record.user_id = original_receiver_id
    end
  end
end
