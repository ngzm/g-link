class AddIdTokenIndexToAuthTokens < ActiveRecord::Migration[5.1]
  def change
    add_index :auth_tokens, :id_token, :unique => true
  end
end
