class ChangeColumnOperationToGame < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :operation, :instruction
  end
end
