class CreateMarcas < ActiveRecord::Migration
  def change
    create_table :marcas do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
