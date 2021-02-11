class AddReceiverReferenceToDeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :deals, :receiver, foreign_key: {to_table: :users}
  end
end
