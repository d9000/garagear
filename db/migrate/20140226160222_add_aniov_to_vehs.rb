class AddAniovToVehs < ActiveRecord::Migration
  def change
    add_column :vehs, :aniov_id, :integer
  end
end
