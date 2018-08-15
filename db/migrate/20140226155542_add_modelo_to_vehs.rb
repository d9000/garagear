class AddModeloToVehs < ActiveRecord::Migration
  def change
    add_column :vehs, :modelo_id, :integer
  end
end
