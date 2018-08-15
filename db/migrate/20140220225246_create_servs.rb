class CreateServs < ActiveRecord::Migration
  def change
    create_table :servs do |t|
      t.integer :tiposervicio_id
      t.string :descripcion

      t.timestamps
    end
  end
end
