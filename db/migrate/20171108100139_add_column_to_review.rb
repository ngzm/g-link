class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :star, :integer, null:false, default:0
  end
end
