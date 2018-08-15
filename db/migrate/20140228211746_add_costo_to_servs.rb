class AddCostoToServs < ActiveRecord::Migration
  def change
    add_column :servs, :costo, :decimal, :precision => 8, :scale => 3
  end
end
