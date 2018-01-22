class ChangeDatatype2StarOfGames < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :star, :float, default: 0, null: false
  end
end
