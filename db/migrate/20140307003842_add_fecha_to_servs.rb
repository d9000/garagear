class AddFechaToServs < ActiveRecord::Migration
  def change
    add_column :servs, :fecha, :datetime
  end
end
