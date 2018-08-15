class AddColumnToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :aniov_id, :integer
  end
end
