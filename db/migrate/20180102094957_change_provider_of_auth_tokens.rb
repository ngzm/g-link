class ChangeProviderOfAuthTokens < ActiveRecord::Migration[5.1]
  def change
    change_column_null :auth_tokens, :provider, false
  end
end
