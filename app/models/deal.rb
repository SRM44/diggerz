class Deal < ApplicationRecord
  extend Enumerize

  belongs_to :receiver_record, class_name: 'Record'
  belongs_to :requester_record, class_name: 'Record'

  enumerize :status, in: [:pending, :accepted, :refused, :confirmed], scope: true
end
