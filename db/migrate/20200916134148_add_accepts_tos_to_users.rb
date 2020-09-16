class AddAcceptsTosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepts_tos, :boolean
  end
end
