class AddKilometrosToServs < ActiveRecord::Migration
  def change
    add_column :servs, :kilometros, :integer
  end
end
