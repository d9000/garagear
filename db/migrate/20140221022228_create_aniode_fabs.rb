class CreateAniodeFabs < ActiveRecord::Migration
  def change
    create_table :aniode_fabs do |t|
      t.integer :modelo_id
      t.string :descripcion

      t.timestamps
    end
  end
end
