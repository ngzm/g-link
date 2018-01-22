class ChangeDatatypeStarOfGames < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :star, :decimal, default: 0.0, null: false
  end
end
