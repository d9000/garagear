class RemoveTiposervicioFromServs < ActiveRecord::Migration
  def change
    remove_column :servs, :tiposervicio_id, :integer
  end
end
