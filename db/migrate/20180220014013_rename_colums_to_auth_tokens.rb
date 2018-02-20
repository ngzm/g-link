class RenameColumsToAuthTokens < ActiveRecord::Migration[5.1]
  def change
    rename_column :auth_tokens, :access_token, :provider_access_token
  end
end
