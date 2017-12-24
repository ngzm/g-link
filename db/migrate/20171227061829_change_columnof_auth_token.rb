class ChangeColumnofAuthToken < ActiveRecord::Migration[5.1]
  def change
    change_column :auth_tokens, :client_token, :string, null: false
    change_column :auth_tokens, :redirect_uri, :string, null: false
  end
end
