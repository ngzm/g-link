class ChangeAgainShowToAdvertise < ActiveRecord::Migration[5.1]
  def change
    change_column_default :advertises, :show, false
  end
end
