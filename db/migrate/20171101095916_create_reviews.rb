class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment, null: false
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
