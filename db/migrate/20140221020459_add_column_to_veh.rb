class AddColumnToVeh < ActiveRecord::Migration
  def change
    add_column :vehs, :version_id, :integer
  end
end
