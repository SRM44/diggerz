class Deal < ApplicationRecord
  STATUSES = [:pending, :accepted, :declined, :canceled]

  STATUSES.each do |status|
    scope status, ->() { where(status: status) }
  end

  extend Enumerize
  enumerize :status, in: STATUSES, predicates: true, default: :pending

  belongs_to :receiver_record, class_name: 'Record'
  belongs_to :requester_record, class_name: 'Record'
end
