class ChangeDatatypeGtypeOfGames < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :gtype, :integer, defalut: 99, null: false
  end
end
