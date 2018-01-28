class CreateAdvertises < ActiveRecord::Migration[5.1]
  def change
    create_table :advertises do |t|
      t.string :title, null: false
      t.string :description
      t.string :src, null: false
      t.integer :type, null: false
      t.integer :priority, null: false
      t.boolean :show, null: false

      t.timestamps
    end
  end
end
