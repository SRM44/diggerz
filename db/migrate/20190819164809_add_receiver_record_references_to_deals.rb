class AddReceiverRecordReferencesToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :receiver_record_id, :bigint
    add_foreign_key :deals, :records, column: :receiver_record_id
    add_index :deals, :receiver_record_id
  end
end
