class ChangeColumnTypeOfAdvertise < ActiveRecord::Migration[5.1]
  def change
    rename_column :advertises, :type, :adtype
  end
end
