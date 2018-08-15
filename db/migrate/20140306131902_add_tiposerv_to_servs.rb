class AddTiposervToServs < ActiveRecord::Migration
  def change
    add_column :servs, :tiposerv_id, :integer
  end
end
