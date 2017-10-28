class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.string :url, null:false
      t.string :img, null:false
      t.integer :category1, null:false, default:1
      t.integer :category2
      t.integer :category3
      t.integer :access, null:false, default:0
      t.integer :star, null:false, default:0

      t.timestamps
    end
  end
end
