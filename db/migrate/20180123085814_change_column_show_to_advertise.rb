class ChangeColumnShowToAdvertise < ActiveRecord::Migration[5.1]
  def change
    change_column :advertises, :show, :boolean, default: true, null: false
  end
end
