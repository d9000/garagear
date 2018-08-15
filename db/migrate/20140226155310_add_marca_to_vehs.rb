class AddMarcaToVehs < ActiveRecord::Migration
  def change
    add_column :vehs, :marca_id, :integer
  end
end
