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
  scope :in_progress,    ->() { where(status: [:accepted, :confirmed_by_requester, :confirmed_by_receiver]) }

  extend Enumerize
  enumerize :status, in: STATUSES, predicates: true, default: :pending

  belongs_to :receiver_record,  class_name: 'Record', autosave: true
  belongs_to :requester_record, class_name: 'Record', autosave: true

  belongs_to :receiver,         class_name: 'User',   autosave: true
  belongs_to :requester,        class_name: 'User',   autosave: true

  def accept
    self.status      = 'accepted'
    self.accepted_at = DateTime.current
  end

  def decline
    self.status      = 'declined'
    self.declined_at = DateTime.current
  end

  def cancel
    self.status      = 'canceled'
    self.canceled_at = DateTime.current
  end

  def canceled?
    status == 'canceled'
  end

  def completed?
    status == 'completed'
  end

  def confirmed_by_requester?
    status == 'confirmed_by_requester'
  end

  def confirmed_by_receiver?
    status == 'confirmed_by_receiver'
  end

  def confirmation_for(user)
    Confirmation.new(self, user)
  end

  def confirm_for(user)
    confirmation_for(user).process
  end
end
