class AddSecretTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :secret_token, :string
  end
end
