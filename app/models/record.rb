class Record < ApplicationRecord
  belongs_to :user
  belongs_to :release

  has_many :pictures, dependent: :destroy

  scope :swappable, ->() { where(swappable: true) }

  scope :available_for_deals, ->() do
    pending_deals_records_ids = Deal.
      pending.
      pluck(:receiver_record_id, :requester_record_id).
      flatten.
      uniq

    swappable.where.not(id: pending_deals_records_ids)
  end
end
