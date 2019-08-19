class AddRequesterRecordReferencesToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :requester_record_id, :bigint
    add_foreign_key :deals, :records, column: :requester_record_id
    add_index :deals, :requester_record_id
  end
end
