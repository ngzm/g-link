class RemoveInstructionFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :instruction, :string
  end
end
