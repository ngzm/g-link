class AddIdentiferIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :identifer, :unique => true
  end
end
