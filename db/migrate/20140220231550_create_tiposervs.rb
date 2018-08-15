class CreateTiposervs < ActiveRecord::Migration
  def change
    create_table :tiposervs do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
