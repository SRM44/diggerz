class AddLifecycleTimestampsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :accepted_at,               :datetime
    add_column :deals, :declined_at,               :datetime
    add_column :deals, :canceled_at,               :datetime
    add_column :deals, :confirmed_by_requester_at, :datetime
    add_column :deals, :confirmed_by_receiver_at,  :datetime
    add_column :deals, :completed_at,              :datetime
  end
end
