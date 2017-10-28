class DropTableGameLinks < ActiveRecord::Migration[5.1]
  def change
    drop_table :game_links
  end
end
