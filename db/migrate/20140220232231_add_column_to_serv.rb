class AddColumnToServ < ActiveRecord::Migration
  def change
    add_column :servs, :veh_id, :integer
  end
end
