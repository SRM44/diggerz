class AddRequesterReferenceToDeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :deals, :requester, foreign_key: { to_table: :users }
  end
end
