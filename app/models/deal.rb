class Deal < ApplicationRecord
  belongs_to :receiver_record, class_name: 'Record'
  belongs_to :requester_record, class_name: 'Record'
end
