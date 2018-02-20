class AddProviderIdTokenToAuthTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :auth_tokens, :provider_id_token, :string
  end
end
