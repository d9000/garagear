class AddColumnToModelo < ActiveRecord::Migration
  def change
    add_column :modelos, :marca_id, :integer
  end
end
