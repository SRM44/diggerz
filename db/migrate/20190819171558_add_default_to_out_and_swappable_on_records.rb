class AddDefaultToOutAndSwappableOnRecords < ActiveRecord::Migration[5.2]
  def change
    change_column_default :records, :swappable, false
    change_column_default :records, :out, false
  end
end
