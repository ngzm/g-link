class CreateAuthTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_tokens do |t|
      t.string :client_token
      t.string :id_token
      t.string :redirect_uri

      t.timestamps
    end

    add_index :auth_tokens, :client_token, unique: true
  end
end
