class AddColumntoAuthTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :auth_tokens, :access_token, :string
    add_column :auth_tokens, :provider, :string
  end
end
