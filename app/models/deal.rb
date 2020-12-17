class Deal < ApplicationRecord
  STATUSES = [
    :pending,
    :accepted,
    :declined,
    :canceled,
    :confirmed_by_requester,
    :confirmed_by_receiver,
    :completed
  ]

  STATUSES.each do |status|
    scope status, ->() { where(status: status) }
  end

  scope :by_most_recent, ->() { order(created_at: :desc) }
  scope :in_progress,    ->() { where(status: [:accepted]) }

  extend Enumerize
  enumerize :status, in: STATUSES, predicates: true, default: :pending

  belongs_to :receiver_record, class_name: 'Record'
  belongs_to :requester_record, class_name: 'Record'

  def accept
    self.status = 'accepted'
  end

  def decline
    self.status = 'declined'
  end

  def cancel
    self.status = 'canceled'
  end

  def confirm_for(user)
    # TODO: encapsulate logic around confirmation based on user
    # & deal previous steps in lifecycle
  end
end
