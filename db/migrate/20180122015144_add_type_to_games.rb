class AddTypeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gtype, :number, default: 99, null: false
  end
end
