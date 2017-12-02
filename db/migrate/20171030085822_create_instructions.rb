class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.string :inst
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
