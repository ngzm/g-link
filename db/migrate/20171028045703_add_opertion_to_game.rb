class AddOpertionToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :operation, :string
  end
end
