class AddCostorepuestosToServs < ActiveRecord::Migration
  def change
    add_column :servs, :costorepuestos, :decimal
  end
end
