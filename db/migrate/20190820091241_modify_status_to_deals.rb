class ModifyStatusToDeals < ActiveRecord::Migration[5.2]
  def change
    change_column_default :deals, :status, "pending"
  end
end
