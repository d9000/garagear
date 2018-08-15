class AddColumnToVehs < ActiveRecord::Migration
  def change
    add_column :vehs, :mime_type, :string
  end
end
